set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_ASM_COMPILER "zig" "cc")
set(CMAKE_ASM_COMPILER_TARGET "aarch64-linux-musl")

set(CMAKE_C_COMPILER "zig" "cc")
set(CMAKE_C_COMPILER_TARGET "aarch64-linux-musl")

set(CMAKE_CXX_COMPILER "zig" "c++")
set(CMAKE_CXX_COMPILER_TARGET "aarch64-linux-musl")

find_program(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar" REQUIRED)

find_program(CMAKE_RANLIB "${CMAKE_CURRENT_LIST_DIR}/zig-ranlib" REQUIRED)