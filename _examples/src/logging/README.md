# Logging

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Flogging%2Fdevcontainer.json)

```cmake:CMakeLists.txt
{{#include CMakeLists.txt}}
```

<details>

```c:main.c
{{#include main.c}}
```

</details>

```sh:
# During the CONFIGURE stage is then the message() command will print things.
cmake -B ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --fresh -B ./build/ -->
```

```sh:
# Notice that none of the message() calls show up here.
cmake --build ./build/
```

```
<!-- cmdrun exec 2>&1 && cmake --build ./build/ --clean-first -->
```