cmake_minimum_required(VERSION 3.30)

project(logging)

# message() can be placed anywhere! Remember, CMake is procedural: it executes
# commands like a programming language. It's not JSON. That means we can place
# message() commands anywhere in the CMakeLists.txt file to print messages to
# the console. This is very useful for debugging and understanding what's
# happening in the GENERATION phase of CMake.
message("Hello, World!")

add_executable(logging main.c)

# message() takes an optional log level as the first argument. Here's all of
# them in one big list. Uncomment the FATAL_ERROR and SEND_ERROR lines to see
# how they cause the build process to fail.

# message(FARAL_ERROR "CMake Error, stop processing and generation. The cmake(1) executable will return a non-zero exit code.")
# message(SEND_ERROR "CMake Error, continue processing, but skip generation.")
message(WARNING "CMake Warning, continue processing.")
message(AUTHOR_WARNING "CMake Warning (dev), continue processing.")
message(DEPRECATION "CMake Deprecation Error or Warning if variable CMAKE_ERROR_DEPRECATED or CMAKE_WARN_DEPRECATED is enabled, respectively, else no message.")
message("Important message printed to stderr to attract user's attention.")
message(NOTICE "Important message printed to stderr to attract user's attention.")
message(STATUS "The main interesting messages that project users might be interested in. Ideally these should be concise, no more than a single line, but still informative.")
message(VERBOSE "Detailed informational messages intended for project users. These messages should provide additional details that won't be of interest in most cases, but which may be useful to those building the project when they want deeper insight into what's happening.")
message(DEBUG "Detailed informational messages intended for developers working on the project itself as opposed to users who just want to build it. These messages will not typically be of interest to other users building the project and will often be closely related to internal implementation details.")
message(TRACE "Fine-grained messages with very low-level implementation details. Messages using this log level would normally only be temporary and would expect to be removed before releasing the project, packaging up the files, etc.")

# But what if you want to print a message during the build process? You can't. I
# mean, you *can* but you really shouldn't. If you're looking to debug what
# CMake's "cmake --build" is doing under the hood then use
# set(CMAKE_EXPORT_COMPILE_COMMANDS ON) or -DCMAKE_EXPORT_COMPILE_COMMANDS=ON to
# generate a compile_commands.json file. Then you can inspect compile_commands.json
# and see what's going on. Tools like Visual Studio Code can also utilize this
# file to provide code completion and other features.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# In fact, the CMake Visual Studio Code extension will add
# "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" to its CMake configuration by default.
