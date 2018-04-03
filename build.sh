#!/usr/bin/env bash

#
# helper script to drive the CMake build
#

#
# Build the core and test sources. Use Intel compiler
#
_do_build() {
  if [ ! -d ./build/ ]
  then
    mkdir ./build/
  fi
  cd ./build/; CC=$(which icc) CXX=$(which icpc) cmake -G "Unix Makefiles" ..; make; STAT=$?; cd - 1>build.log
  return $STAT
}


# Build the core and test sources. Use GCC compiler
#
_do_build_gcc() {
  if [ ! -d ./build/ ]
  then
    mkdir ./build/
  fi
  cd ./build/; CC=$(which gcc) CXX=$(which g++) cmake -G "Unix Makefiles" ..; make; STAT=$?; cd - 1>build.log
  return $STAT
}

##
# Run tests, build with Intel
#
_do_test() {
  _do_build && ( cd ./build/; ctest --verbose; cd - 1>build.log )
}

##
# Run tests, build with GCC
#
_do_test_gcc() {
  _do_build_gcc && (  cd ./build/; ctest --verbose; cd - 1>build.log )
}

#
# clean off the project state
#
_do_clean() {
  if [ -e ./build/Makefile ]
  then
    cd ./build/; make clean; cd - 1>/dev/null
  fi
  rm -rf build bin lib
}

#
# generate Xcode project with CMake
#
_do_xcode() {
  if [ -d ./xcode/ ]
  then
    rm -rf ./xcode/
  fi
  mkdir ./xcode/
  cd ./xcode/; cmake -G "Xcode" ..; cd - 1>build.log
}

#
# generate Doxygen project docs
#
_do_doxygen() {
  cd ./src/; doxygen ../settings/doxy.cnf; cd - 1>doxygen.log
}

#
# show usage information
#
_show_usage() {
  echo "TFM-ng build script"
  echo "=================================================================="
  echo "./build.sh [OPTION]"
  echo ""
  echo "Options:"
  echo "build      Build core and test sources, using Intel C++ compiler (DEFAULT)"
  echo "buildgcc   Build core and test sources, using GCC C++ compiler"
  echo "test       Run tests after building core and test sources with Intel C++ compiler"
  echo "testgcc    Run tests after building core and test sources with GCC C++ compiler"
  echo "xcode      Generate top-level Xcode project, deleting any existing instance"
  echo "doc        Generate documentation using Doxygen"
  echo "clean      Cleans the project, deleting old build state"
  echo "help       Display this help message"
  echo ""
  echo "Note: Build targets use CMake to build out of tree in ./build directory"
  echo "      Xcode project is generated in ./xcode directory"
  echo "      Xcode project uses bundled Clang compiler by default"
  echo "      Xcode tests log to ./xcode/Testing/Temporary directory"
  echo ""
}

#
# main
#
case "$1" in
  "build")          
    _do_build
    ;;
  "buildgcc"|"build-gcc"|"build_gcc"|"gccbuild"|"gcc-build"|"gcc_build")
    _do_build_gcc
    ;;
  "test")
    _do_test
    ;;
  "testgcc"|"testgcc"|"test-gcc"|"test_gcc"|"gcctest"|"gcc-test"|"gcc_test")
    _do_test_gcc
    ;;
  "clean")
    _do_clean
    ;;
  "xcode")
    _do_xcode
    ;;
  "doc"|"dox")
    _do_doxygen
    ;;
  "help")
    _show_usage
    ;;
  *)
    _do_build
    ;;
esac
