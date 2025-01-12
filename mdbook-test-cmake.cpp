// 2>/dev/null; ${CXX:-c++} $CXXFLAGS -std=c++20 -o "${o=$(mktemp)}" "$0" && exec "$o" "$@"
#include <format>
#include <iostream>
#include <regex>
#include <string>
#include <vector>
#include <unordered_map>
#include <tuple>
#include <optional>
#include <filesystem>
#include <fstream>
#include <sstream>

using namespace std::string_literals;

struct args {
    std::filesystem::path dir;
    std::filesystem::path dest_dir;
    std::optional<std::string> chapter;
    std::filesystem::path s;
    std::optional<std::string> workflow;

    std::string long_about() {
        return R"(Tests that a book's CMake code samples compile

Usage: ./mdbook-test-cmake.cpp [OPTIONS] [dir]

Arguments:
  [dir]  Root directory for the book
         (Defaults to the current directory when omitted)

Options:
  -d, --dest-dir <dest-dir>     Output directory for the book
                                Relative paths are interpreted relative to the book's root directory.
                                If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.
  -c, --chapter <chapter>
  -S <source-dir>               "cmake -S <dir>" source directory. Defaults to the root directory of the book.
      --workflow <preset>       CMake workflow to use like "cmake --workflow <preset>".
                                Can use "{0}" which will be replaced with the stem of the chapter file.
                                Can use "{1}" which will be replaced with the 1-based index of the code block.
  -h, --help                    Print help)"s;
    }

    static args parse_from(int argc, char *argv[]) {
        auto args2 = args{};
        for (auto i = 1; i < argc; ++i) {
            auto arg = std::string(argv[i]);
            if (arg == "-h" || arg == "--help") {
                std::cout << args2.long_about() << "\n";
                std::exit(0);
            } else if (arg == "-d" || arg == "--dest-dir") {
                if (i + 1 < argc) {
                    args2.dest_dir = std::filesystem::path(argv[++i]);
                    if (!args2.dest_dir.is_absolute()) {
                        args2.dest_dir = args2.dir / args2.dest_dir;
                    }
                } else {
                    std::cerr << std::format("Error: Missing value for {}\n", arg);
                    std::exit(1);
                }
            } else if (arg == "-c" || arg == "--chapter") {
                if (i + 1 < argc) {
                    args2.chapter = argv[++i];
                } else {
                    std::cerr << std::format("Error: Missing value for {}\n", arg);
                    std::exit(1);
                }
            } else if (arg == "--workflow") {
                if (i + 1 < argc) {
                    args2.workflow = argv[++i];
                } else {
                    std::cerr << std::format("Error: Missing value for {}\n", arg);
                    std::exit(1);
                }
            } else if (arg == "-S") {
                if (i + 1 < argc) {
                    args2.s = std::filesystem::path(argv[++i]);
                    if (!args2.s.is_absolute()) {
                        args2.s = args2.dir / args2.s;
                    }
                } else {
                    std::cerr << std::format("Error: Missing value for {}\n", arg);
                    std::exit(1);
                }
            } else {
                args2.dir = std::filesystem::path(arg);
            }
        }
        if (args2.dir.empty()) {
            args2.dir = std::filesystem::current_path();
        }
        if (args2.dest_dir.empty()) {
            args2.dest_dir = args2.dir / "book";
        }
        if (args2.s.empty()) {
            args2.s = args2.dir;
        }
        return args2;
    }
};

int main(int argc, char *argv[]) {
    auto args2 = args::parse_from(argc, argv);
    
    // FIXME: Get the src directory from book.toml
    auto book_toml_ifs = std::ifstream(args2.dir / "book.toml");
    if (!book_toml_ifs.is_open()) {
        std::cerr << std::format("Error: {} not found\n", (args2.dir / "book.toml").string());
        std::exit(1);
    }
    auto book_toml_oss = std::ostringstream();
    book_toml_oss << book_toml_ifs.rdbuf();
    auto book_toml_str = book_toml_oss.str();
    // src = "src"
    auto book_toml_src_re = std::regex(R"--(src\s*?=\s*?"(.+?)")--");
    auto book_toml_src_match = std::smatch();
    if (!std::regex_search(book_toml_str, book_toml_src_match, book_toml_src_re)) {
        std::cerr << std::format("Error: src not found in {}\n", (args2.dir / "book.toml").string());
        std::exit(1);
    }
    auto src = args2.dir / book_toml_src_match[1].str();

    // FIXME: Get a list of chapters from SUMMARY.md
    auto summary_md_ifs = std::ifstream(src / "SUMMARY.md");
    if (!summary_md_ifs.is_open()) {
        std::cerr << std::format("Error: {} not found\n", (src / "SUMMARY.md").string());
        std::exit(1);
    }
    auto summary_md_oss = std::ostringstream();
    summary_md_oss << summary_md_ifs.rdbuf();
    auto summary_md_str = summary_md_oss.str();
    // [Hello world](hello-world.md)
    auto summary_md_re = std::regex(R"--(\[(.+?)\]\((.+?)\))--");
    // "Hello world" -> <resolved path to "hello-world.md">
    auto summary = std::unordered_map<std::string, std::filesystem::path>();
    for (auto it = std::sregex_iterator(summary_md_str.begin(), summary_md_str.end(), summary_md_re);
         it != std::sregex_iterator(); ++it) {
        auto match = *it;
        auto title = match[1].str();
        auto path = match[2].str();
        auto resolved_path = src / path;
        summary[title] = resolved_path;
    }

    auto count = 0;
    for (auto [title, path] : summary) {
        if (args2.chapter.has_value() && title != args2.chapter.value()) {
            continue;
        }
        ++count;
        std::cout << std::format("Testing chapter '{}': \"{}\"\n", title, path.string());
        auto chapter_md_ifs = std::ifstream(path);
        if (!chapter_md_ifs.is_open()) {
            std::cerr << std::format("Error: {} not found\n", path.string());
            std::exit(1);
        }
        auto chapter_md_oss = std::ostringstream();
        chapter_md_oss << chapter_md_ifs.rdbuf();
        auto chapter_md_str = chapter_md_oss.str();

        // FIXME: Extract CMake code blocks from the chapter
        // ```cmake (code) ```
        auto cmake_code_block_re = std::regex(R"--(```cmake\n([\s\S]+?)\n```)--");
        auto cmake_code_blocks = std::vector<std::string>();
        for (auto it = std::sregex_iterator(chapter_md_str.begin(), chapter_md_str.end(), cmake_code_block_re);
             it != std::sregex_iterator(); ++it) {
            auto match = *it;
            auto code_block = match[1].str();
            cmake_code_blocks.push_back(code_block);
        }

        auto n = 0;
        for (auto code_block : cmake_code_blocks) {
            auto cmakelists_txt_ofs = std::ofstream(args2.s / "CMakeLists.txt");
            cmakelists_txt_ofs << code_block;
            cmakelists_txt_ofs.close();

            ++n;

            auto build_dir = args2.dir / "build" / path.stem() / std::to_string(n);
            std::filesystem::remove_all(build_dir);

            if (args2.workflow.has_value()) {
                auto cmd = std::format("cmake --workflow {}", std::vformat(args2.workflow.value(), std::make_format_args(path.stem().string(), n)));
                std::cout << std::format("$ {}\n", cmd);
                auto cwd = std::filesystem::current_path();
                std::filesystem::current_path(args2.s);
                auto exit_code = std::system(cmd.c_str());
                std::filesystem::current_path(cwd);
                if (exit_code != 0) {
                    std::cerr << std::format("Error: \"{}\" failed with exit code {}\n", cmd, exit_code);
                    std::filesystem::remove(args2.s / "CMakeLists.txt");
                    std::exit(1);
                }
            } else {
                auto cmd = std::format("cmake -B {}", build_dir.string());
                std::cout << std::format("$ {}\n", cmd);
                auto cwd = std::filesystem::current_path();
                std::filesystem::current_path(args2.s);
                auto exit_code = std::system(cmd.c_str());
                std::filesystem::current_path(cwd);
                if (exit_code != 0) {
                    std::cerr << std::format("Error: \"{}\" failed with exit code {}\n", cmd, exit_code);
                    std::filesystem::remove(args2.s / "CMakeLists.txt");
                    std::exit(1);
                }

                auto cmd2 = std::format("cmake --build {}", build_dir.string());
                std::cout << std::format("$ {}\n", cmd2);
                auto cwd2 = std::filesystem::current_path();
                std::filesystem::current_path(args2.s);
                auto exit_code2 = std::system(cmd2.c_str());
                std::filesystem::current_path(cwd2);
                if (exit_code2 != 0) {
                    std::cerr << std::format("Error: \"{}\" failed with exit code {}\n", cmd2, exit_code2);
                    std::filesystem::remove(args2.s / "CMakeLists.txt");
                    std::exit(1);
                }
            }

            std::filesystem::remove(args2.s / "CMakeLists.txt");
        }
    }
    if (count == 0 && args2.chapter.has_value()) {
        std::cerr << std::format("Error: Chapter '{}' not found\n", args2.chapter.value());
        std::exit(1);
    }

    return 0;
}