// -*- C++ -*-
//
// Package:     Concurrency
// Class  :     WaitingTaskList
// 
// Implementation:
//     [Notes on implementation]
//
// Original Author:  Chris Jones
//         Created:  Thu Feb 21 13:46:45 CST 2013
// $Id$
//

// system include files

// user include files
#include "tbb/task.h"
#include <cassert>

#include "hc/WaitingTaskList.h"
#include "hc/hardware_pause.h"

using namespace hc;
//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
WaitingTaskList::WaitingTaskList(unsigned int iInitialSize):
m_head{nullptr},
m_nodeCache{new WaitNode[iInitialSize]},
m_nodeCacheSize{iInitialSize},
m_lastAssignedCacheIndex{0},
m_waiting{true}
{
  auto nodeCache = m_nodeCache.get();
  for(auto it = nodeCache, itEnd = nodeCache+m_nodeCacheSize; it!=itEnd; ++it) {
    it->m_fromCache=true;
  }
}

//
// member functions
//
void
WaitingTaskList::reset()
{
  m_exceptionPtr = std::exception_ptr{};
  unsigned int nSeenTasks = m_lastAssignedCacheIndex;
  m_lastAssignedCacheIndex = 0;
  assert(m_head == nullptr);
  if (nSeenTasks > m_nodeCacheSize) {
    //need to expand so next time we don't have to do any
    // memory requests
    m_nodeCacheSize = nSeenTasks;
    m_nodeCache.reset( new WaitNode[nSeenTasks] );
    auto nodeCache = m_nodeCache.get();
    for(auto it = nodeCache, itEnd = nodeCache+m_nodeCacheSize; it!=itEnd; ++it) {
      it->m_fromCache=true;
    }
  }
  //this will make sure all cores see the changes
  m_waiting = true;
}

WaitingTaskList::WaitNode*
WaitingTaskList::createNode(WaitingTask* iTask)
{
  unsigned int index = m_lastAssignedCacheIndex++;
  
  WaitNode* returnValue;
  if( index < m_nodeCacheSize) {
    returnValue = m_nodeCache.get()+index;
  } else {
    returnValue = new WaitNode;
    returnValue->m_fromCache=false;
  }
  returnValue->m_task = iTask;
  returnValue->m_next = returnValue;
  
  return returnValue;
}


void
WaitingTaskList::add(WaitingTask* iTask) {
  iTask->increment_ref_count();
  if(!m_waiting) {
    if(m_exceptionPtr) {
      iTask->dependentTaskFailed(m_exceptionPtr);
    }
    if(0==iTask->decrement_ref_count()) {
      tbb::task::spawn(*iTask);
    }
  } else {
    WaitNode* newHead = createNode(iTask);
    WaitNode* oldHead = m_head.exchange(newHead);
    newHead->setNextNode(oldHead);

    //For the case where oldHead != nullptr,
    // even if 'm_waiting' changed, we don't
    // have to recheck since we beat 'announce()' in
    // the ordering of 'm_head.exchange' call so iTask
    // is guaranteed to be in the link list

    if(nullptr == oldHead) {
      if(!m_waiting) {
        //if finished waiting right before we did the
        // exchange our task will not be spawned. Also,
        // additional threads may be calling add() and swapping
        // heads and linking us to the new head.
        // It is safe to call announce from multiple threads
        announce();
      }
    }
  }
}

void
WaitingTaskList::announce()
{
  //Need a temporary storage since one of these tasks could
  // cause the next event to start processing which would refill
  // this waiting list after it has been reset
  WaitNode* n = m_head.exchange(nullptr);
  WaitNode* next;
  while(n) {
    //it is possible that 'WaitingTaskList::add' is running in a different
    // thread and we have a new 'head' but the old head has not yet been
    // attached to the new head (we identify this since 'nextNode' will return itself).
    //  In that case we have to wait until the link has been established before going on.
    while(n == (next=n->nextNode())) {
      hardware_pause();
    }
    auto t = n->m_task;
    if(m_exceptionPtr) {
      t->dependentTaskFailed(m_exceptionPtr);
    }
    if(0==t->decrement_ref_count()){
      tbb::task::spawn(*t);
    }
    if(!n->m_fromCache ) {
      delete n;
    }
    n=next;
  }
}

void
WaitingTaskList::doneWaiting(std::exception_ptr iPtr)
{
  m_exceptionPtr = iPtr;
  m_waiting=false;
  announce();
}
