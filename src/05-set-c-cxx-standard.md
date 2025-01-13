# Set C/C++ standard

Filename: `CMakeLists.txt`

```cmake
{{#include ../listings/05-set-c-cxx-standard/CMakeLists.txt}}
```

Filename: `src/bin/hello-c23.c`

```c
{{#include ../listings/05-set-c-cxx-standard/src/bin/hello-c23.c}}
```

Filename: `src/bin/hello-cxx23.cpp`

```cpp
{{#include ../listings/05-set-c-cxx-standard/src/bin/hello-cxx23.cpp}}
```

```txt
{{#include ../listings/05-set-c-cxx-standard/output.txt}}
```

When you run this example yourself make sure you have a compiler that supports C23 and C++23. You can set the C and C++ compiler that CMake will use by setting the `CC` and `CXX` environment variables.
