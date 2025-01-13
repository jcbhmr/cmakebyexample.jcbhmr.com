![mdBook](https://img.shields.io/static/v1?style=for-the-badge&message=mdBook&color=000000&logo=mdBook&logoColor=FFFFFF&label=)
![CMake](https://img.shields.io/static/v1?style=for-the-badge&message=CMake&color=064F8C&logo=CMake&logoColor=FFFFFF&label=)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jcbhmr/cmakebyexample.jcbhmr.com?quickstart=1)

Make sure you've installed [mdBook](https://rust-lang.github.io/mdBook/). You'll also need [CMake](https://cmake.org/download/) for most edits.

The custom `theme/highlight.js` is needed because the default mdBook `highlight.js` doesn't include the some languages. To regenerate a custom build of `theme/highlight.js` use `./scripts/generate-highlightjs.sh`.

To create a new example:

1. Add it to `SUMMARY.md`. \
    Ex: `- [Cool feature](14-cool-feature.md)`
2. Create a markdown file in `src/` with a numeric prefix. \
    Ex: `src/14-cool-feature.md`
3. Create a directory in `listings/`. \
    Ex: `listings/14-cool-feature/`
4. Create a new `devcontainer.json` in `.devcontainer/<id>/`. \
    Ex: `.devcontainer/14-cool-feature/devcontainer.json`
5. Add content to the example.
6. Add any software requirements to the `devcontainer.json` file. \
    Ex: `"updateContentCommand": "sudo apt-get install libzstd-dev"`
7. Manually generate an `output.txt` file in the `listings/<id>/` directory. \
    Ex: `listings/14-cool-feature/output.txt`
