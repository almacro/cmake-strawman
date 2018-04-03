cmake_minimum_required (VERSION 2.8.9 FATAL_ERROR)

project (omp_demo)

set (CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set (EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})

include(FindOpenMP)
if(OPENMP_FOUND)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")

  if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    message("*** HAVE Intel compiler")
  else()
    message("*** HAVE NON-Intel compiler")
  endif()
else()
    message("*** ERROR cannot config OpenMP")
endif()

#find_library(omp)

file (GLOB SOURCES "src/*.cpp")

add_executable (omp_hello ${SOURCES})
