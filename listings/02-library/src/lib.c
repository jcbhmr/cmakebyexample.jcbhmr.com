#include <greeter.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *greeting_for(char const *name) {
    char *greeting = malloc(strlen(name) + 8);
    sprintf(greeting, "Hello, %s!", name);
    return greeting;
}