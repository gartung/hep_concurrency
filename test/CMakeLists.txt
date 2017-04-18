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

add_test(NAME testHEPConcurrency COMMAND testHEPConcurrency)

add_executable(test_threadSafeOutputFileStream
  test_threadSafeOutputFileStream.cpp
)

target_include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(test_threadSafeOutputFileStream PUBLIC
  HEPConcurrency
)

add_test(NAME test_threadSafeOutputFileStream COMMAND test_threadSafeOutputFileStream)

add_executable(ThreadSafeAddOnlyContainer_t
  ThreadSafeAddOnlyContainer_t.cpp
)

target_include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(ThreadSafeAddOnlyContainer_t PUBLIC
  HEPConcurrency
  ${CPPUNIT_LIBRARY}
)

add_test(NAME ThreadSafeAddOnlyContainer_t COMMAND ThreadSafeAddOnlyContainer_t)
