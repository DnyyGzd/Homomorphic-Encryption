#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y curl git tar unzip zip zstd \
                    build-essential clang cmake \
                    libboost-all-dev libprotobuf-dev protobuf-compiler

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

cd ~/Documents/
wget https://github.com/microsoft/SEAL/archive/refs/tags/v4.1.1.zip
unzip v4.1.1.zip -d SEAL

cd ~/Documents/SEAL/
cmake -S . -B build -DSEAL_BUILD_EXAMPLES=ON -DSEAL_BUILD_TESTS=ON -DSEAL_BUILD_BENCH=ON -DSEAL_THROW_ON_TRANSPARENT_CIPHERTEXT=OFF
cmake --build build
sudo cmake --install build
