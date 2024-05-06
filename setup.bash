#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y build-essential cmake curl git tar unzip zip zstd

cd ~/Documents/
wget https://github.com/microsoft/SEAL/archive/refs/tags/v4.1.1.zip
unzip v4.1.1.zip

cd ~/Documents/SEAL-4.1.1/
cmake -S . -B build -DSEAL_BUILD_EXAMPLES=ON -DSEAL_BUILD_TESTS=ON -DSEAL_BUILD_BENCH=ON
cmake --build build
sudo cmake --install build
