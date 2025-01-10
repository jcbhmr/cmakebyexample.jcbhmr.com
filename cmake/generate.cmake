# Web form that uses this API at https://highlightjs.org/download. This will
# generate the highlight.js using all the default mdBook included languages
# plus some extras. Needs "curl" available; CMake can't do REST API calls
# within CMake itself (that I know of).
set(data [=[{
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
}]=])
execute_process(COMMAND curl --request POST --header "Content-Type: application/json" --data "${data}" https://highlightjs.org/api/download --output ./highlight.zip)
file(ARCHIVE_EXTRACT INPUT ./highlight.zip DESTINATION ./theme/ PATTERNS highlight.min.js)
file(RENAME ./theme/highlight.min.js ./theme/highlight.js)
file(REMOVE ./highlight.zip)