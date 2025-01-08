#!/usr/bin/env bash
set -ex

sudo apt-get update

(
    cd "$(mktemp -d)"
    # wget doesn't work for some reason. 🤷‍♀️
    curl -LO https://apt.kitware.com/kitware-archive.sh
    chmod +x ./kitware-archive.sh
    sudo ./kitware-archive.sh
    rm -rf "$PWD"
)
sudo apt-get install -y cmake

cargo install mdbook
cargo install mdbook-cmdrun mdbook-codename

(
    cd ~
    mkdir -p cosmocc
    cd cosmocc
    wget https://cosmo.zip/pub/cosmocc/cosmocc.zip
    unzip cosmocc.zip
    rm cosmocc.zip
)

curl -sS https://webi.sh/zig | sh
source ~/.config/envman/PATH.env

sudo apt-get update
sudo apt-get install -y clang-format

pipx install cmakelang
