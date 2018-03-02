#!/usr/bin/env bash

_do_build() {
  if [ ! -d ./build/ ]
  then
    mkdir ./build/
  fi
  cd ./build/; cmake -G "Unix Makefiles" ..; make; cd - 1>build.log
}

_do_test() {
  _do_build
  cd ./build/; make test; cd - 1>build.log
  ./build/test/Test
}

_do_clean() {
  if [ -e ./build/Makefile ]
  then
    cd ./build/; make clean; cd - 1>/dev/null
  fi
  rm -rf build
}

case "$1" in
  "build")          
    _do_build
    ;;
  "test")
    _do_test
    ;;
  "clean")
    _do_clean
    ;;
  *)
    _do_build
    ;;
esac
