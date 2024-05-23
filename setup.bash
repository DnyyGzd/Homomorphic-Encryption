#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y autoconf build-essential cmake git

git clone https://github.com/openfheorg/openfhe-development.git
cd openfhe-development
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

sudo apt install -y pybind11-dev python3-pip

git clone https://github.com/openfheorg/openfhe-python.git
cd openfhe-python
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..
