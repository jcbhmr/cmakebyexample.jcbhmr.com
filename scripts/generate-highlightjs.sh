#!/usr/bin/env bash
set -Eeuxo pipefail

# https://highlightjs.org/download
curl --request POST --header "Content-Type: application/json" --data '{
    "api": 2,
    "languages": [
        "apache",
        "armasm",
        "bash",
        "c",
        "coffeescript",
        "cpp",
        "csharp",
        "css",
        "d",
        "diff",
        "go",
        "handlebars",
        "haskell",
        "http",
        "ini",
        "java",
        "javascript",
        "json",
        "julia",
        "kotlin",
        "less",
        "lua",
        "makefile",
        "markdown",
        "nginx",
        "nim",
        "nix",
        "objectivec",
        "perl",
        "php",
        "plaintext",
        "properties",
        "python",
        "r",
        "ruby",
        "rust",
        "scala",
        "scss",
        "shell",
        "sql",
        "swift",
        "typescript",
        "x86asm",
        "xml",
        "yaml",
    
        "cmake",
        "dos"
    ]
}' https://highlightjs.org/api/download --output ./highlight.zip
unzip -o ./highlight.zip highlight.min.js -d ./theme/
mv ./theme/highlight.min.js ./theme/highlight.js
rm ./highlight.zip
