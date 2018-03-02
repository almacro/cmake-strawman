include_directories (${TEST_SOURCE_DIR}/src
                     ${googletest_INCLUDE_DIRS}
)
add_executable (Test test.cpp)
target_link_libraries (Test
                       Sqr
                       gtest
                       gmock_main
)
add_test (NAME MyTest COMMAND Test)
