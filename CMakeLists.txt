cmake_minimum_required(VERSION 3.6)
set(CMAKE_CXX_FLAGS "-std=c++14 -pthread")
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/modules ${CMAKE_MODULE_PATH})
find_package(TBB)
find_package(CppUnit)

include_directories(${CMAKE_SOURCE_DIR})
include_directories(${TBB_INCLUDE_DIRS})
include_directories(${CPPUNIT_INCLUDE_DIR})

add_subdirectory(hc)
add_subdirectory(test)

install(DIRECTORY modules DESTINATION ${CMAKE_INSTALL_PREFIX} )
install(DIRECTORY hc DESTINATION ${CMAKE_INSTALL_PREFIX}/include FILES_MATCHING PATTERN "*.h*" )
