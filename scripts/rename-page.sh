#!/usr/bin/env bash
set -Eeuxo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <old-page> <new-page>"
    exit 1
fi

old_page="$1"
new_page="$2"

if [[ -f "./src/$new_page.md" || -d "./listings/$new_page" ]]; then
    echo "Error: $new_page already exists."
    exit 1
fi

mv "./src/$old_page.md" "./src/$new_page.md"
mv "./listings/$old_page/" "./listings/$new_page/"
find ./src/ -type f -exec sed -i "s/$old_page/$new_page/g" {} +
