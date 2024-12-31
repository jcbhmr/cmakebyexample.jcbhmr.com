<p align=center>
    <b><a href="https://cmakebyexample.jcbhmr.com/">You're probably looking for cmakebyexample.jcbhmr.com 😉</a></b>
</p>

## Development

![mdBook](https://img.shields.io/static/v1?style=for-the-badge&message=mdBook&color=000000&logo=mdBook&logoColor=FFFFFF&label=)
![CMake](https://img.shields.io/static/v1?style=for-the-badge&message=CMake&color=064F8C&logo=CMake&logoColor=FFFFFF&label=)

Make sure you've installed [mdBook](https://rust-lang.github.io/mdBook/guide/installation.html) and [CMake](https://cmake.org/download/). You'll also need to install [mdbook-cmdrun](https://github.com/FauconFan/mdbook-cmdrun). Run `mdbook serve` to see the live preview.

The custom `theme/highlight.js` is needed because the default mdBook `highlight.js` doesn't include the `cmake` language. The current custom build includes [all of the mdBook defaults](https://rust-lang.github.io/mdBook/format/theme/syntax-highlighting.html#supported-languages) plus `cmake`. Generate it using https://highlightjs.org/download and use the `./highlight.min.js` file from the resulting `.zip` download.

To create a new example:

1. Come up with a slug like `cool-feature`.
2. Add it to `src/SUMMARY.md` like `- [Cool feature](cool-feature/index.md)`.
3. Create a new folder to hold the example like `src/cool-feature`.
4. Add a `README.md` to the new folder.
5. Create your example. Take note of any dependencies it needs (Clang, clang-format, Vcpkg, Conan, etc.).
6. Add a lot of comments to your code files to explain what's going on. The `README.md` is for shell commands. The code files are for other prose.
7. `{{#include filename.txt}}` any relevant files in the `src/cool-feature/README.md` inside `` ``` `` code blocks.
8. Add any shell commands to interact with the example to the `src/cool-feature/README.md`. Make sure to document them.
9. (Optional) Use `<!-- cmdrun cmake ... -->` or similar inside a `` ``` `` code block to run that command and use its output at build time.
10. Create a corresponding `.devcontainer/cool-feature/devcontainer.json` that will open the example's folder. Add any necessary dependencies to the dev container.
11. Add an "Open in Codespaces" button to the `src/cool-feature/README.md`.
