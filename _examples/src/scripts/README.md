# Scripts

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Fscripts%2Fdevcontainer.json)

```cmake:cat.cmake
{{#include cat.cmake}}
```

<details>

```txt:raven.txt
{{#include raven.txt}}
```

</details>

```sh:Linux/macOS
# You only need to do this once.
chmod +x ./cat.cmake
# Now you can directly invoke the CMake script!
./cat.cmake ./raven.txt
```

```cmd:Windows
REM On Windows you need to manually invoke it.
cmake -P ./cat.cmake ./raven.txt
```

```
<!-- cmdrun exec 2>&1 && ./cat.cmake ./raven.txt -->
```