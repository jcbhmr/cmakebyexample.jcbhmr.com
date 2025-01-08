set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_PROCESSOR arm64)

set(CMAKE_ASM_COMPILER "zig" "cc")
set(CMAKE_ASM_COMPILER_TARGET "aarch64-macos-none")

set(CMAKE_C_COMPILER "zig" "cc")
set(CMAKE_C_COMPILER_TARGET "aarch64-macos-none")

set(CMAKE_CXX_COMPILER "zig" "c++")
set(CMAKE_CXX_COMPILER_TARGET "aarch64-macos-none")

find_program(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar" REQUIRED)

find_program(CMAKE_RANLIB "${CMAKE_CURRENT_LIST_DIR}/zig-ranlib" REQUIRED)