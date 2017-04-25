add_library(HEPConcurrency SHARED 
  SerialTaskQueue.cc
  WaitingTaskList.cc
  ThreadSafeOutputFileStream.cc
)

target_include_directories(HEPConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(HEPConcurrency PUBLIC
  ${TBB_LIBRARIES}
)

install( TARGETS HEPConcurrency EXPORT HEPConcurrency DESTINATION  lib )

