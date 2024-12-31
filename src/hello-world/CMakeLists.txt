# First we require a minimum version of CMake. It's a good idea to choose
# something recent. You can find the latest version on the CMake website
# https://cmake.org/download/. This function is HIGHLY RECOMMENDED. It should be
# before even the project() function.
cmake_minimum_required(VERSION 3.30)

# Next we define a project. Think of a project as similar to a Python package, a
# JavaScript package, a Rust package, etc. This project() function call will
# define all subsequent targets (executables, libraries, etc.) in the scope of
# this project. You may specify more than just a project name:
#
#     project(<PROJECT-NAME>
#       [VERSION <major>[.<minor>[.<patch>[.<tweak>]]]]
#       [DESCRIPTION <project-description-string>]
#       [HOMEPAGE_URL <url-string>]
#       [LANGUAGES <language-name>...])
project(hello-world)

# Finally, we add an executable target. This will create an executable named
# hello-world from the source file main.c. You are able to specify more than one
# source file if you wish:
#
#     add_executable(<name> <options>... <sources>...)
#
# For example: add_executable(hello-world main.c other.c). For now we only need
# one main.c file.
add_executable(hello-world main.c)
