#!/usr/bin/env bash
set -ex

cargo install mdbook
cargo install mdbook-cmdrun mdbook-codename

curl https://apt.kitware.com/kitware-archive.sh | sudo sh
sudo apt-get update
sudo apt-get install -y cmake

sudo apt-get update
sudo apt-get install -y lsb-release wget software-properties-common gnupg
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" bash all

sudo apt-get update
sudo apt-get install -y clang-format

pipx install cmakelang

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

curl -sS https://webi.sh/zig | sh
source ~/.config/envman/PATH.env
