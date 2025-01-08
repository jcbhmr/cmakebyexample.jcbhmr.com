<p align=center>
    <b><a href="https://cmakebyexample.jcbhmr.com/">You're probably looking for cmakebyexample.jcbhmr.com 😉</a></b>
</p>

## Development

![mdBook](https://img.shields.io/static/v1?style=for-the-badge&message=mdBook&color=000000&logo=mdBook&logoColor=FFFFFF&label=)
![CMake](https://img.shields.io/static/v1?style=for-the-badge&message=CMake&color=064F8C&logo=CMake&logoColor=FFFFFF&label=)

Make sure you've installed:

- [CMake](https://cmake.org/download/)
- [mdBook](https://rust-lang.github.io/mdBook/)
- [mdbook-cmdrun](https://github.com/FauconFan/mdbook-cmdrun)
- [mdbook-codename](https://github.com/smallkirby/mdbook-codename)
- clang-format

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1&devcontainer_path=.devcontainer%2Fdevcontainer.json)

The custom `theme/highlight.js` is needed because the default mdBook `highlight.js` doesn't include the some languages. To regenerate a custom build of `theme/highlight.js` use `./task.cmake generate`.

To create a new example ("Cool feature" in this example):

1. Add it to `src/SUMMARY.md` like `- [Cool feature](cool-feature/README.md)`.
2. Create a `src/cool-feature/README.md`.
3. Create your example in `src/cool-feature/`. Add a bunch of comments _in the code files_ so that they are visible on the website and when viewing the file in an IDE.
4. `{{#include filename.txt}}` any interesting files in `src/cool-feature/README.md`.
5. Add any shell commands to interact with the example to the `src/cool-feature/README.md`. Make sure to document them.
6. (Optional) Use `<!-- cmdrun cmake ... -->` or similar inside a `` ``` `` code block to run that command and use its output at build time. Remember to add `--fresh` and `--clean-first` to CMake commands so that the output is reproducable. Also add `exec 2>&1 && ...` so that stderr is redirected to stdout (which is what `mdbook-cmdrun` captures).
7. Create a corresponding `.devcontainer/cool-feature/devcontainer.json` that will open the example's folder. Add any necessary dependencies to the dev container.
8. Add an "Open in Codespaces" button to the `src/cool-feature/README.md`.
