include_directories(${CMAKE_SOURCE_DIR})
include_directories(/usr/include/)
add_subdirectory(test)
add_library(FWCoreConcurrency SHARED 
  src/SerialTaskQueue.cc
  src/WaitingTaskList.cc
  src/ThreadSafeOutputFileStream.cc
)

target_include_directories(FWCoreConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
include_directories(FWCoreConcurrency PUBLIC ${TBB_INCLUDE_DIRS})
target_link_libraries(FWCoreConcurrency PUBLIC
  ${TBB_LIBRARIES}
)

install( TARGETS FWCoreConcurrency EXPORT FWCoreConcurrency DESTINATION  lib )

