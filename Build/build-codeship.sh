#!/bin/bash
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
make install
ls -l /usr/${CROSS}/lib/libcrypto*
cd -
echo "*******************************************"
echo "****** Finisehed building OpenSSL... ******"
echo "*******************************************"
echo "Building and installing SQLite3..."
wget https://www.sqlite.org/2018/sqlite-autoconf-3220000.tar.gz
tar -xvf sqlite-autoconf-3220000.tar.gz
cd sqlite-autoconf-3220000
./configure --prefix=/usr/${CROSS} --host=arm-linux-gnueabihf --target=arm-linux-gnueabihf  --enable-threadsafe
make
cd .libs/
$AR -x libsqlite3.a
$CC -shared *.o -o libsqlite3.so.0.8.6
cd -
make install
cd ../
echo "*******************************************"
echo "****** Finisehed building SQLite3... ******"
echo "*******************************************"
g++ main.cpp -o hello_x86_64 -lssl -lcrypto
#file hello_x86_64
./hello_x86_64
${CROSS}-g++ -Wall -L/usr/${CROSS}/lib -I/usr/${CROSS}/include/openssl/ main.cpp -o hello_arm -lssl -lcrypto
file hello_arm

