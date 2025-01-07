#!/usr/bin/env -S cmake -P
cmake_minimum_required(VERSION 3.30)

function(task_generate)
    # Web form that uses this API at https://highlightjs.org/download. This will
    # generate the highlight.js using all the default mdBook included languages
    # plus some extras. Needs "curl" available; CMake can't do REST API calls
    # within CMake itself (that I know of).
    set(data [=[{
        "api": 2,
        "languages": [
            "apache",
            "armasm",
            "bash",
            "c",
            "coffeescript",
            "cpp",
            "csharp",
            "css",
            "d",
            "diff",
            "go",
            "handlebars",
            "haskell",
            "http",
            "ini",
            "java",
            "javascript",
            "json",
            "julia",
            "kotlin",
            "less",
            "lua",
            "makefile",
            "markdown",
            "nginx",
            "nim",
            "nix",
            "objectivec",
            "perl",
            "php",
            "plaintext",
            "properties",
            "python",
            "r",
            "ruby",
            "rust",
            "scala",
            "scss",
            "shell",
            "sql",
            "swift",
            "typescript",
            "x86asm",
            "xml",
            "yaml",
        
            "cmake",
            "dos"
        ]
    }]=])
    execute_process(COMMAND curl --request POST --header "Content-Type: application/json" --data "${data}" https://highlightjs.org/api/download --output ./highlight.zip)
    file(ARCHIVE_EXTRACT INPUT ./highlight.zip DESTINATION ./theme/ PATTERNS highlight.min.js)
    file(RENAME ./theme/highlight.min.js ./theme/highlight.js)
    file(REMOVE ./highlight.zip)
endfunction()

function(task_format)
    file(
    GLOB_RECURSE
    c_cxx_files
    src/*.c
    src/*.cpp
    src/*.cc
    src/*.cxx
    src/*.h
    src/*.hxx
    src/*.hh
    src/*.hpp)
    execute_process(COMMAND clang-format -i ${c_cxx_files})

  file(
    GLOB_RECURSE
    cmake_files
    cmake/*.cmake
    src/*CMakeLists.txt
    src/*.cmake
    test/*CMakeLists.txt
    test/*.cmake)
  list(APPEND cmake_files CMakeLists.txt)
  execute_process(COMMAND cmake-format -i ${cmake_files})
endfunction()

function(task_dev)
    execute_process(COMMAND mdbook serve)
endfunction()

function(task_build)
    execute_process(COMMAND mdbook build)
endfunction()

set(task_name "${CMAKE_ARGV3}")
if(NOT task_name)
    message("no task name")
elseif(task_name STREQUAL "generate")
    task_generate()
elseif(task_name STREQUAL "format")
    task_format()
elseif(task_name STREQUAL "dev")
    task_dev()
elseif(task_name STREQUAL "build")
    task_build()
else()
    message("no such task ${task_name}")
endif()
