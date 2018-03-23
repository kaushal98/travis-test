#!/bin/bash
sudo apt-get install {gcc,g++}-arm-linux-gnueabi{,hf}
arm-linux-gnueabhihf-g++ main.cpp -o hello
git clone https://github.com/openssl/openssl
git checkout OpenSSL_1_0_2
