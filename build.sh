#!/usr/bin/env bash

if [ $# -ge 1 ]
then
  if [ $1="clean" ]
  then
    if [ -e ./build/Makefile ]
    then
      cd ./build/; make clean; cd - 1>/dev/null
    fi
    rm -rf build
  else
    echo "Command not found"
    exit 1
  fi
else
  if [ ! -d ./build/ ]
  then
    mkdir ./build/
  fi
  cd ./build/; cmake -G "Unix Makefiles" ..; make; cd - 1>build.log
fi
