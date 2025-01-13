cmake_minimum_required(VERSION 3.31)

project(executable LANGUAGES C CXX)

add_executable(hello-world ./src/bin/hello-world.c)

add_executable(goodbye-world ./src/bin/goodbye-world.cpp)
