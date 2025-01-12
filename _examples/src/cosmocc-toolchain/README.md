# cosmocc toolchain

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Fcosmocc-toolchain%2Fdevcontainer.json)

```cmake:cmake/cosmocc.cmake
{{#include cmake/cosmocc.cmake}}
```

```cmake:cmake/cosmocc-override.cmake
{{#include cmake/cosmocc-override.cmake}}
```

<details>

```c:main.c
{{#include main.c}}
```

```cmake:CMakeLists.txt
{{#include CMakeLists.txt}}
```

</details>

```sh:
cmake --toolchain ./cmake/cosmocc.cmake -B ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --fresh --toolchain ./cmake/cosmocc.cmake -B ./build/ -->
```

```sh:
cmake --build ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --build ./build/ --clean-first -->
```

<details>

```sh:
./build/cosmocc-toolchain
```

```
<!-- cmdrun exec 2>&1 && ./build/cosmocc-toolchain -->
```

</details>
