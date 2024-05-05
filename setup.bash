#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y build-essential cmake curl git tar unzip zip zstd

cd ~/Documents/
wget https://github.com/microsoft/SEAL/archive/refs/tags/v4.1.1.zip
unzip v4.1.1.zip

cd SEAL-4.1.1/
cmake -S . -B build
cmake --build build
sudo cmake --install build
