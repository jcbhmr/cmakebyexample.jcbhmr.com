---
title: Logging
---

<figure>
<figcaption><code>CMakeLists.txt</code></figcaption>

```cmake
cmake_minimum_required(VERSION 3.30)

message("Hello, message() before project()!")

project(logging)

add_executable(logging ./src/main.c)

# message(FARAL_ERROR "Hello, FATAL_ERROR!")
# message(SEND_ERROR "Hello, SEND_ERROR!")
message(WARNING "Hello, WARNING!")
message(AUTHOR_WARNING "Hello, AUTHOR_WARNING!")
message(DEPRECATION "Hello, DEPRECATION!")
message("Hello, no log level!")
message(NOTICE "Hello, NOTICE!")
message(STATUS "Hello, STATUS!")
message(VERBOSE "Hello, VERBOSE!")
message(DEBUG "Hello, DEBUG!")
message(TRACE "Hello, TRACE!")

# But what if you want to print a message during the build process? You can't. I
# mean, you *can* but you really shouldn't. If you're looking to debug what
# CMake's "cmake --build" is doing under the hood then use
# set(CMAKE_EXPORT_COMPILE_COMMANDS ON) or -DCMAKE_EXPORT_COMPILE_COMMANDS=ON to
# generate a compile_commands.json file. Then you can inspect compile_commands.json
# and see what's going on. Tools like Visual Studio Code can also utilize this
# file to provide code completion and other features.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# In fact, the CMake Visual Studio Code extension will add
# "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" to its CMake configuration by default.
```

</figure>

<details>

<figure>
<figcaption><code>src/main.c</code></figcaption>

```c
#include <stdio.h>

int main() {
    puts("Hello, World!");
    return 0;
}
```

</figure>

</details>

```sh:test
cmake -B ./build/
cmake --build ./build/
```

You should see something like this:

```

```