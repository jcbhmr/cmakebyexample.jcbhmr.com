#!/usr/bin/env -S cmake -P

# ^^ This hashbang uses the popular "env -S" extension which lets us supply more
# than a single argument to the interpreter command. On Linux/macOS you would
# "chmod +x <this_script>" and then "./<this_script>" to run it. On Windows you
# must manually "cmake -P <this_script>" to run it.

cmake_minimum_required(VERSION 3.30)

# We can use the "cmake -P" mode to invoke CMake in **script mode** which does
# NOT use a project() or define targets. Instead, script mode just runs
# commands. That's it. CMake scripts are useful when you want to do ad-hoc
# things like move build files around, precompute some tables, download some
# things and extract them, etc. while still staying within the C/C++/CMake
# ecosystem. You can invoke a script like:
#
#     cmake -P <script_file>
# 
# For example, when called like "./cat.cmake ./raven.txt" on Linux/macOS or
# "cmake -P ./cat.cmake ./ravent.txt" on Linux/macOS/Windows...
#
#     message("CMAKE_ARGC=${CMAKE_ARGC}")
#     message("CMAKE_ARGV0=${CMAKE_ARGV0}")
#     message("CMAKE_ARGV1=${CMAKE_ARGV1}")
#     message("CMAKE_ARGV2=${CMAKE_ARGV2}")
#     message("CMAKE_ARGV3=${CMAKE_ARGV3}")
#     message("CMAKE_ARGV4=${CMAKE_ARGV4}")
#
# ...would print:
#
#     CMAKE_ARGC=4
#     CMAKE_ARGV0=cmake
#     CMAKE_ARGV1=-P
#     CMAKE_ARGV2=./cat.cmake
#     CMAKE_ARGV3=./raven.txt
#
# The CMAKE_ARGV${N} arguments keep going if you need want arguments.

# For this "cat.cmake" example we want to grab the first non-hashbang related
# argument which is CMAKE_ARGV3.
set(input_file "${CMAKE_ARGV3}")

# Then we read the file:
file(READ "${input_file}" file_contents)

# And finally we print it. We use "echo_append" because a) it prints to stdout
# instead of stderr (which is where message() goes) and b) it doesn't append an
# extra newline (which the other "cmake -E echo" does).
execute_process(COMMAND ${CMAKE_COMMAND} -E echo_append "${file_contents}")
