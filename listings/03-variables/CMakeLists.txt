cmake_minimum_required(VERSION 3.31)

project(variables LANGUAGES C)

message("CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}") # "/workspace" or similar
message("CMAKE_BINARY_DIR=${CMAKE_BINARY_DIR}") # "/workspace/build" or similar
message("CMAKE_C_COMPILER=${CMAKE_C_COMPILER}") # "/usr/bin/cc" or similar
message("CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}") # "/usr/bin/c++" or similar
message("CMAKE_AR=${CMAKE_AR}") # "/usr/bin/ar" or similar
message("CMAKE_RANLIB=${CMAKE_RANLIB}") # "/usr/bin/ranlib" or similar
message("PROJECT_NAME=${PROJECT_NAME}") # "variables"
message("CMAKE_HOST_UNIX=${CMAKE_HOST_UNIX}") # TRUE if the host system is UNIX-like
message("CMAKE_WIN32=${CMAKE_WIN32}") # TRUE if the target system is Windows

set(MY_BOOL ON) # BOOL type
set(MY_EXE_NAME "variables") # STRING type
set(MY_SOURCE_FILES "./src/main.c" "./src/stats.c") # list type

add_executable("${MY_EXE_NAME}" ${MY_SOURCE_FILES})
