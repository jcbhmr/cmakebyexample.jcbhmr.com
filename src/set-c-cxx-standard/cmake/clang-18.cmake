set(CMAKE_ASM_COMPILER "clang-18")

set(CMAKE_C_COMPILER "clang-18")

set(CMAKE_CXX_COMPILER "clang++-18")

find_program(CMAKE_AR "llvm-ar-18" REQUIRED)

find_program(CMAKE_RANLIB "llvm-ranlib-18" REQUIRED)

string(APPEND CMAKE_CXX_FLAGS " -stdlib=libc++ -fuse-ld=lld")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -stdlib=libc++ -fuse-ld=lld")
