cmake_minimum_required(VERSION 3.31)

project(control-flow LANGUAGES C)

foreach(varname IN ITEMS WIN32 UNIX APPLE)
    if("${${varname}}") # Double expansion. "${WIN32}" or similar.
        add_executable("${varname}-only" "./src/bin/${varname}-only.c")
    endif()
endforeach()
