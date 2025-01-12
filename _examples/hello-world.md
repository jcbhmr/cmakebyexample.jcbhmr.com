---
title: Hello world!
---

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

<figure>
<figcaption><code>CMakeLists.txt</code></figcaption>

```cmake
cmake_minimum_required(VERSION 3.31)

project(hello-world LANGUAGES C)

add_executable(hello-world ./src/main.c)
```

</figure>

```sh:test
cmake -B ./build/
cmake --build ./build/
./build/hello-world
```