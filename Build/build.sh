#!/bin/bash
sudo apt-get install {gcc,g++}-arm-linux-gnueabi{,hf}
g++ main.cpp -o hello_x86_64
arm-linux-gnueabihf-g++ main.cpp -o hello_arm
file hello_x86_64
file hello_arm
git clone https://github.com/openssl/openssl
cd openssl
git checkout OpenSSL_1_0_2
export CROSS=arm-linux-gnueabihf
export AR=${CROSS}-ar
export AS=${CROSS}-as
export CC="${CROSS}-gcc -fPIC"
export CXX="${CROSS}-g++ -fPIC"
export LD=${CROSS}-g++ 
./Configure --openssldir=./out/final shared Os/compiler:${CC}
make
make install
ls -l
cd -
