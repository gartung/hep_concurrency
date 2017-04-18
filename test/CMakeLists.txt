add_executable(testFWCoreConcurrency
  serialtaskqueue_t.cppunit.cpp
  serialtaskqueuechain_t.cppunit.cpp
  waitingtasklist_t.cppunit.cpp
)

target_include_directories(testFWCoreConcurrency PUBLIC ${CPPUNIT_INCLUDE_DIR})
include_directories(testFWCoreConcurrency PUBLIC ${CPPUNIT_INCLUDE_DIR})
target_include_directories(testFWCoreConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(testFWCoreConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(testFWCoreConcurrency PUBLIC
  FWCoreConcurrency
  ${CPPUNIT_LIBRARY}
)

install( TARGETS testFWCoreConcurrency EXPORT testFWCoreConcurrency DESTINATION  bin )

add_executable(test_threadSafeOutputFileStream
  test_threadSafeOutputFileStream.cpp
)

target_include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(test_threadSafeOutputFileStream PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(test_threadSafeOutputFileStream PUBLIC
  FWCoreConcurrency
)

install( TARGETS test_threadSafeOutputFileStream EXPORT test_threadSafeOutputFileStream DESTINATION  bin )

add_executable(ThreadSafeAddOnlyContainer_t
  ThreadSafeAddOnlyContainer_t.cpp
)

target_include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(ThreadSafeAddOnlyContainer_t PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(ThreadSafeAddOnlyContainer_t PUBLIC
  FWCoreConcurrency
  ${CPPUNIT_LIBRARY}
)

install( TARGETS ThreadSafeAddOnlyContainer_t EXPORT ThreadSafeAddOnlyContainer_t DESTINATION  bin )

add_executable(TestFWCoreConcurrencyDriver
  TestFWCoreConcurrencyDriver.cpp
  TestHelper.cc
  EDMException.cc
  Exception.cc
  RegexMatch.cc
)

target_include_directories(TestFWCoreConcurrencyDriver PUBLIC ${Boost_INCLUDE_DIR})
include_directories(TestFWCoreConcurrencyDriver PUBLIC ${Boost_INCLUDE_DIR})
target_include_directories(TestFWCoreConcurrencyDriver PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(TestFWCoreConcurrencyDriver PUBLIC ${TBB_INCLUDE_DIRS})
target_include_directories(TestFWCoreConcurrencyDriver PUBLIC ${MD5_INCLUDE_DIR})
target_link_libraries(TestFWCoreConcurrencyDriver PUBLIC
  FWCoreConcurrency
  ${Boost_FILESYSTEM_LIBRARY_RELEASE}  
  ${Boost_SYSTEM_LIBRARY_RELEASE}
)

install( TARGETS TestFWCoreConcurrencyDriver EXPORT TestFWCoreConcurrencyDriver DESTINATION  bin )

