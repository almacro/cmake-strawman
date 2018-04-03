# cmake-strawman

This is a strawman example that shows how to build OpenMP with CMake.

## Useful targets
The shell script [build.sh](./build.sh) configures CMake and runs some action.
It has targets to build, test and clean the project.

To build the project use
```
bash build.sh build
```

To test the project, building from source as needed use
```
bash build.sh test
```

To cleanup build and generated files use
```
bash build.sh clean
```
