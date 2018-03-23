#!/bin/bash
sudo apt-get install {gcc,g++}-arm-linux-gnueabi{,hf}
g++ main.cpp -o hello_x86_64
arm-linux-gnueabihf-g++ main.cpp -o hello_arm
file hello_x86_64
file hello_arm
git clone https://github.com/openssl/openssl
git checkout OpenSSL_1_0_2-stable
