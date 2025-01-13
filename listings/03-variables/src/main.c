#include <stdio.h>
#include "./stats.h"

int main() {
    printf("Hello, %s!\n", "World");
    printf("The average of 1, 2, and 3 is %f.\n", average_of_three(1, 2, 3));
    return 0;
}