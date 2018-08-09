#include <iostream>
//#define USE_OPENSSL
#ifdef USE_OPENSSL
#include <openssl/opensslv.h>
#include <openssl/crypto.h>
#endif
#include "test.h"

using namespace std;

int main() {
    printHello();
#ifdef USE_OPENSSL
    std::cout << "OpenSSL version: " << SSLeay_version(SSLeay()) << std::endl;
#endif
    return 0;
}
