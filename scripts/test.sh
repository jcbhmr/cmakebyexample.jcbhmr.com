#!/usr/bin/env bash
set -Eeuxo pipefail

test_listing() {
    local listing="$1"
    pushd "$listing"
    if [[ -f CMakeLists.txt ]]; then
        if [[ -f CMakePresets.json ]]; then
            cmake --workflow test --fresh
        else
            cmake --fresh -B ./build/
            cmake --build ./build/ --clean-first
        fi
    fi
    popd
}

if [[ $# -eq 1 ]]; then
    test_listing "./listings/$1"
else
    for listing in ./listings/*; do
        test_listing "$listing"
    done
fi