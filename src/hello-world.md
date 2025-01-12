# Hello world

```cmake
cmake_minimum_required(VERSION 3.31)

project(hello-world LANGUAGES C)

add_executable(hello-world ./hello-world.c)
```

```sh
$ cmake -B /workspaces/cmakebyexample.jcbhmr.com/build/hello-world/1
-- The C compiler identification is Clang 18.1.8
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/clang-18 - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /workspaces/cmakebyexample.jcbhmr.com/build/hello-world/1
$ cmake --build /workspaces/cmakebyexample.jcbhmr.com/build/hello-world/1
[ 50%] Building C object CMakeFiles/hello-world.dir/hello-world.c.o
[100%] Linking C executable hello-world
[100%] Built target hello-world
```