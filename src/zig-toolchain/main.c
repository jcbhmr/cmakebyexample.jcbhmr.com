#include <stdio.h>

int main() {
    #if defined(__x86_64__) || defined(_M_X64)
        puts("This is x86-64 also known as x64");
    #elif defined(__aarch64__) || defined(_M_ARM64)
        puts("This is AArch64 also known as ARM64");
    #else
        puts("This is some other architecture");
    #endif
    return 0;
}