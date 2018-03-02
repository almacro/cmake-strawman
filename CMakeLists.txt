cmake_minimum_required (VERSION 3.2)

project (TEST)

include(CTest)

include(DownloadProject.cmake)
download_project(PROJ              googletest
                 GIT_REPOSITORY    https://github.com/google/googletest.git
                 GIT_TAG           master
                 ${UPDATED_DISCONNECTED_IF_AVAILABLE}
)

add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})

add_subdirectory (src)

enable_testing()
add_subdirectory (test)

