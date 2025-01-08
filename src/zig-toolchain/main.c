#include <stdio.h>

int main() {
    #if defined(__x86_64__) || defined(_M_X64)
        puts("This is x86-64 also known as x64");
    #elif defined(__aarch64__) || defined(_M_ARM64)
        puts("This is AArch64 also known as ARM64");
    #else
        puts("This is some other architecture");
    #endif

    #if defined(_WIN32) || defined(_WIN64)
        puts("You're on Windows");
    #elif defined(__unix__)
        puts("You're on Linux");
    #else
        puts("Not Windows or Linux");
    #endif

    return 0;
}