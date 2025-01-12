set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(CMAKE_ASM_COMPILER "zig" "cc")
set(CMAKE_ASM_COMPILER_TARGET "x86_64-windows-gnu")

set(CMAKE_C_COMPILER "zig" "cc")
set(CMAKE_C_COMPILER_TARGET "x86_64-windows-gnu")

set(CMAKE_CXX_COMPILER "zig" "c++")
set(CMAKE_CXX_COMPILER_TARGET "x86_64-windows-gnu")

find_program(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar" REQUIRED)

find_program(CMAKE_RANLIB "${CMAKE_CURRENT_LIST_DIR}/zig-ranlib" REQUIRED)