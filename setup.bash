#!/bin/bash

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean

sudo apt install -y curl git python3-pip tar unzip zip zstd \
                    build-essential clang cmake \
                    libboost-all-dev libprotobuf-dev protobuf-compiler

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

cd ~/Documents/
git clone -b v4.1.1 https://github.com/microsoft/SEAL.git

cd ~/Documents/SEAL/
cmake -DSEAL_BUILD_EXAMPLES=ON -DSEAL_BUILD_TESTS=ON -DSEAL_BUILD_BENCH=ON -DSEAL_THROW_ON_TRANSPARENT_CIPHERTEXT=OFF .
make -j
sudo make install

cd ~/Documents/
git clone https://github.com/microsoft/EVA.git

cd ~/Documents/EVA/
git submodule update --init
sed -i -e 's/find_package(SEAL 3.6 REQUIRED)/#find_package(SEAL 3.6 REQUIRED)\nfind_package(SEAL 4.1 REQUIRED)/' CMakeLists.txt
cmake .
make -j
python3 -m pip install numpy
python3 -m pip install -e python/
python3 python/setup.py bdist_wheel --dist-dir='.'
python3 tests/all.py
