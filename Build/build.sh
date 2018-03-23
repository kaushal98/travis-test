#!/bin/bash
sudo apt-get install {gcc,g++}-arm-linux-gnueabi{,hf}
g++ main.cpp -o hello_x86_64 -lssl -lcrypto
echo "*******************************************"
echo "****** Cross compiling for ARMv7L... ******"
echo "*******************************************"
echo "Building and installing OpenSSL..."
git clone https://github.com/openssl/openssl
cd openssl
git checkout OpenSSL_1_0_2
export CROSS=arm-linux-gnueabihf
export AR=${CROSS}-ar
export AS=${CROSS}-as
export CC="${CROSS}-gcc -fPIC"
export CXX="${CROSS}-g++ -fPIC"
export LD=${CROSS}-g++ 
./Configure --prefix=/usr/${CROSS} shared os/compiler:${CC}
make
sudo make install
ls -l /usr/${CROSS}/lib/libcrypto*
cd -
arm-linux-gnueabihf-g++ main.cpp -o hello_arm
file hello_x86_64
file hello_arm

