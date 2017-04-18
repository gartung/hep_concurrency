include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_executable(testHEPConcurrency
  serialtaskqueue_t.cppunit.cpp
  serialtaskqueuechain_t.cppunit.cpp
  waitingtasklist_t.cppunit.cpp
)

target_include_directories(testHEPConcurrency PUBLIC ${CPPUNIT_INCLUDE_DIR})
include_directories(testHEPConcurrency PUBLIC ${CPPUNIT_INCLUDE_DIR})
target_include_directories(testHEPConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(testHEPConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(testHEPConcurrency PUBLIC
  HEPConcurrency
  ${CPPUNIT_LIBRARY}
)

install( TARGETS testHEPConcurrency EXPORT testHEPConcurrency DESTINATION  bin )

add_executable(test_threadSafeOutputFileStream
  test_threadSafeOutputFileStream.cpp
)

target_include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(test_threadSafeOutputFileStream PUBLIC
  HEPConcurrency
)

install( TARGETS test_threadSafeOutputFileStream EXPORT test_threadSafeOutputFileStream DESTINATION  bin )

add_executable(ThreadSafeAddOnlyContainer_t
  ThreadSafeAddOnlyContainer_t.cpp
)

target_include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(ThreadSafeAddOnlyContainer_t PUBLIC
  HEPConcurrency
  ${CPPUNIT_LIBRARY}
)

install( TARGETS ThreadSafeAddOnlyContainer_t EXPORT ThreadSafeAddOnlyContainer_t DESTINATION  bin )


