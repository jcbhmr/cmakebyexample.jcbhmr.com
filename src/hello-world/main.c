// You can compile and run this program directly without CMake using a C
// compiler manually. Here's how you might do so with GCC:
//
//     gcc -o hello-world main.c
//     ./hello-world
//
// ...but that can quickly become unweildly when you add more .c files,
// dependencies, include directories, etc. That's where CMake really shines.

#include <stdio.h>

int main() {
  puts("Hello, World!");
  return 0;
}
