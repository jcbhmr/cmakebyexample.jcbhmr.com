cmake_minimum_required(VERSION 3.31)

project(library LANGUAGES C)

add_library(greeter ./src/lib.c)
target_include_directories(greeter PUBLIC ./include)