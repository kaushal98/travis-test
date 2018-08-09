#!/bin/bash
g++ main.cpp -fprofile-arcs -ftest-coverage -o hello_x86_64 -lgcov
file hello_x86_64
./hello_x86_64

