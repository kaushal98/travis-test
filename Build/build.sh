#!/bin/bash
echo "*******************************************"
echo "****** Cross compiling for ARMv7L... ******"
echo "*******************************************"
sudo apt-get install {gcc,g++}-arm-linux-gnueabi{,hf}
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
g++ main.cpp -o hello_x86_64 -lssl -lcrypto
file hello_x86_64
./hello_x86_64
${CROSS}-g++ -Wall -L/usr/${CROSS}/lib -I/usr/${CROSS}/include/openssl/ main.cpp -lssl -lcrypto
file hello_arm

