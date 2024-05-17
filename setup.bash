#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y autoconf build-essential cmake git

git clone https://github.com/openfheorg/openfhe-development.git
cd openfhe-development
mkdir build
cd build
cmake ..
make
make install
