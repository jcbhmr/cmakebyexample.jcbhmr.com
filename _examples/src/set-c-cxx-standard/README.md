# Set C/C++ standard

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Fset-c-cxx-standard%2Fdevcontainer.json)

```c:main1.c
{{#include main1.c}}
```

```cpp:main2.cpp
{{#include main2.cpp}}
```

```cmake:CMakeLists.txt
{{#include CMakeLists.txt}}
```

```sh:
cmake -B ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --fresh -B ./build/ -->
```

```sh:
cmake --build ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --build ./build/ --clean-first -->
```

```sh:
./build/main1
```

```
<!-- cmdrun exec 2>&1 && ./build/main1 -->
```

```sh:
./build/main2
```

```
<!-- cmdrun exec 2>&1 && ./build/main2 -->
```
