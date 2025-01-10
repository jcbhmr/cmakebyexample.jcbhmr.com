cmake_minimum_required(VERSION 3.30)

project(cmakebyexample.jcbhmr.com LANGUAGES NONE)

find_program(mdbook mdbook REQUIRED)

add_custom_command(
    OUTPUT book
    COMMAND pwd
    DEPENDS src
    USES_TERMINAL
)

# add_custom_command(
#     OUTPUT
# )

# function(task_format)
#     file(
#     GLOB_RECURSE
#     c_cxx_files
#     src/*.c
#     src/*.cpp
#     src/*.cc
#     src/*.cxx
#     src/*.h
#     src/*.hxx
#     src/*.hh
#     src/*.hpp)
#     execute_process(COMMAND clang-format -i ${c_cxx_files})

#   file(
#     GLOB_RECURSE
#     cmake_files
#     cmake/*.cmake
#     src/*CMakeLists.txt
#     src/*.cmake
#     test/*CMakeLists.txt
#     test/*.cmake)
#   list(APPEND cmake_files CMakeLists.txt)
#   execute_process(COMMAND cmake-format -i ${cmake_files})
# endfunction()

# function(task_dev)
#     execute_process(COMMAND mdbook serve)
# endfunction()

# function(task_build)
#     execute_process(COMMAND mdbook build)
# endfunction()

# set(task_name "${CMAKE_ARGV3}")
# if(NOT task_name)
#     message("no task name")
# elseif(task_name STREQUAL "generate")
#     task_generate()
# elseif(task_name STREQUAL "format")
#     task_format()
# elseif(task_name STREQUAL "dev")
#     task_dev()
# elseif(task_name STREQUAL "build")
#     task_build()
# else()
#     message("no such task ${task_name}")
# endif()
