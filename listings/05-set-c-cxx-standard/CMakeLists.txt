cmake_minimum_required(VERSION 3.31)

project(set-c-cxx-standard LANGUAGES C CXX)

add_executable(hello-c23 ./src/bin/hello-c23.c)
target_compile_features(hello-c23 PRIVATE c_std_23)

add_executable(hello-cxx23 ./src/bin/hello-cxx23.cpp)
target_compile_features(hello-cxx23 PRIVATE cxx_std_23)