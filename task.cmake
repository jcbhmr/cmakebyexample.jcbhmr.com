#!/usr/bin/env -S cmake -P

function(test)
    execute_process(COMMAND ./run WORKING_DIRECTORY ./src/hello-world)
endfunction()

if(NOT DEFINED CMAKE_ARGV3)
    message(FATAL_ERROR "CMAKE_ARGV3 not defined")
endif()
if(CMAKE_ARGV3 STREQUAL "test")
    test()
elseif(CMAKE_ARGV3 STREQUAL "generate")
    generate()
else()
    message(FATAL_ERROR "Unknown task: ${CMAKE_ARGV3}")
endif()
