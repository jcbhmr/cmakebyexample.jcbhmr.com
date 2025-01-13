#!/usr/bin/env bash
set -Eeuxo pipefail

# TODO: Update this every so often.
cmake_version="3.31"

# Find all *.cmake or CMakeLists.txt files and replace "cmake_minimum_required(VERSION ...)" with "cmake_minimum_required(VERSION $cmake_version)".
find ./listings/ -type f '(' -name '*.cmake' -or -name 'CMakeLists.txt' ')' -exec sed -i "s/cmake_minimum_required(VERSION [0-9.]\+)/cmake_minimum_required(VERSION $cmake_version)/g" {} +
