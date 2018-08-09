#!/bin/bash
g++ main.cpp -fprofile-arcs -ftest-coverage -o hello_x86_64
file hello_x86_64
./hello_x86_64
#${CROSS}-g++ -Wall -L/usr/${CROSS}/lib -I/usr/${CROSS}/include/openssl/ main.cpp -o hello_arm -lssl -lcrypto
#file hello_arm

