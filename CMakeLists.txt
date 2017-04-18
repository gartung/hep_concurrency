cmake_minimum_required(VERSION 3.6)
set(CMAKE_CXX_FLAGS "-std=c++14 -pthread")
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/modules ${CMAKE_MODULE_PATH})
find_package(TBB)
find_package(CppUnit)
#set(Boost_NO_BOOST_CMAKE ON)
#set(Boost_NO_SYSTEM_PATHS ON)
#find_package(Boost 1.57.0 COMPONENTS filesystem thread iostreams python regex serialization system program_options )
#include_directories(${Boost_INCLUDE_DIR})
include_directories(${CMAKE_SOURCE_DIR})
include_directories(${TBB_INCLUDE_DIRS})
include_directories(${CPPUNIT_INCLUDE_DIR})

add_subdirectory(test)
add_library(FWCoreConcurrency SHARED 
  src/SerialTaskQueue.cc
  src/WaitingTaskList.cc
  src/ThreadSafeOutputFileStream.cc
)

target_include_directories(FWCoreConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
target_include_directories(FWCoreConcurrency PUBLIC ${Boost_INCLUDE_DIR})
target_link_libraries(FWCoreConcurrency PUBLIC
  ${TBB_LIBRARIES}
)

install( TARGETS FWCoreConcurrency EXPORT FWCoreConcurrency DESTINATION  lib )

