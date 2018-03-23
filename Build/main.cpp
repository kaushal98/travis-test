#include <iostream>
//#define USE_OPENSSL
#ifdef USE_OPENSSL
#include <openssl/opensslv.h>
#include <openssl/crypto.h>
#endif

using namespace std;

int main() {
    std::cout << "Hello World" << std::endl;
#ifdef USE_OPENSSL
    std::cout << "OpenSSL version: " << SSLeay_version(SSLeay()) << std::endl;
#endif
    return 0;
}
