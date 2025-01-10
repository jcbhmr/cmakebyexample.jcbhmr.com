#!/usr/bin/env bash
set -ex

# https://rust-lang.github.io/mdBook/guide/installation.html
cargo install mdbook
cargo install mdbook-cmdrun mdbook-codename

# https://apt.kitware.com/
curl https://apt.kitware.com/kitware-archive.sh | sudo sh
sudo apt-get update
sudo apt-get install -y cmake

# https://apt.llvm.org/
sudo apt-get update
sudo apt-get install -y lsb-release wget software-properties-common gnupg
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" bash all

# https://stackoverflow.com/a/49718985
sudo apt-get update
sudo apt-get install -y clang-format

# https://cmake-format.readthedocs.io/en/latest/installation.html
pipx install cmakelang

# https://github.com/jart/cosmopolitan?tab=readme-ov-file#getting-started
(
    cd ~
    mkdir -p cosmocc
    cd cosmocc
    wget https://cosmo.zip/pub/cosmocc/cosmocc.zip
    unzip cosmocc.zip
    echo 'export PATH="$PATH:$HOME/cosmocc/bin"' >> ~/.bashrc
    rm cosmocc.zip
)
# https://github.com/jart/cosmopolitan/issues/1325
chmod +x ~/cosmocc/bin/cosmoranlib

# https://github.com/ziglang/zig/wiki/Install-Zig-from-a-Package-Manager
# Ubuntu snap isn't set up on dev containers so this is easier.
# https://webinstall.dev/zig/
curl -sS https://webi.sh/zig | sh
source ~/.config/envman/PATH.env
