set(CMAKE_SYSTEM_NAME Generic)
unset(CMAKE_SYSTEM_PROCESSOR)

set(CMAKE_ASM_COMPILER "cosmocc")

set(CMAKE_C_COMPILER "cosmocc")

set(CMAKE_CXX_COMPILER "cosmoc++")

find_program(CMAKE_AR "cosmoar" REQUIRED)

find_program(CMAKE_RANLIB "cosmoranlib" REQUIRED)

set(CMAKE_USER_MAKE_RULES_OVERRIDE
    "${CMAKE_CURRENT_LIST_DIR}/cosmocc-override.cmake")

