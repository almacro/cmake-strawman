# cmake-strawman
This is a simple project setup using [CMake](https://cmake.org/) and Googletest.
I modeled after the basic [CMake]() setup described [here](https://stackoverflow.com/questions/14446495/cmake-project-structure-with-unit-tests), replacing the [Boost_Test](http://www.boost.org/doc/libs/1_63_0/libs/test/doc/html/boost_test/testing_tools/boost_test_universal_macro.html) with [googletest](https://github.com/google/googletest).
Crascit's [post](https://crascit.com/2015/07/25/cmake-gtest/) and [code](https://github.com/Crascit/DownloadProject) details the DownloadProject module used here.

## Useful targets
The shell script [build.sh](./build.sh) configures CMake and runs some action.
It has targets to build, test and clean the project.

To build the project use
```
bash build.sh build
```

To test the project, building from source as needed use
```
bash build.sh build
```

To cleanup build and generated files use
```
bash build.sh build
```
