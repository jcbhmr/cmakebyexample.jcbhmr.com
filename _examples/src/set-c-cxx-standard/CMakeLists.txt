cmake_minimum_required(VERSION 3.30)

project(set-c-cxx-standard)

add_executable(main1 main1.c)
target_compile_features(main1 PRIVATE c_std_23)

add_executable(main2 main2.cpp)
target_compile_features(main2 PRIVATE cxx_std_23)
