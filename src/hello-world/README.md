# Hello world

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Fhello-world%2Fdevcontainer.json)

```c
{{#include main.c}}
```

```cmake
{{#include CMakeLists.txt}}
```

CMake isn't actually a build system itself. It's a meta build system. CMake takes your imperative build instructions from the CMakeLists.txt script and generates the complicated structure that each platform-specific build tool requires. For example, GNU Makefiles on Linux, Xcode projects on macOS, and Visual Studio solutions on Windows. This is called "configuring". You can perform the configure step by running `cmake`. **But** by default that creates a lot of files in the current working directory. That gets messy with complicated `.gitignore` patterns and such. It's much easier to perform an *out of source build* where we tell CMake to put those files in another folder like `./build/` instead of `./`. That's where the `-B build` flag comes in.

```sh
cmake -B ./build/
```

```
<!-- cmdrun cmake -B ./build/ -->
```

Now that we've generated the platform-specific build system files in `./build/`, we can tell CMake to invoke `make`, `msbuild`, `ninja`, or another build command in that directory to finally build our project. This stage is aptly called "building". You can perform the build step by running `cmake --build <configure_output_folder>` where `<configure_output_folder>` is the folder you specified with the `-B` flag. In our case, that's `./build/`.

```sh
cmake --build ./build/
```

```
<!-- cmdrun cmake --build ./build/ -->
```

And finally we can run the executable that was built in `./build/`. The executable is named `hello-world` because that's the target name we specified in the `add_executable()` function in `CMakeLists.txt`.

```sh
./build/hello-world
```

```
<!-- cmdrun ./build/hello-world -->
```
