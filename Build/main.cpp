#include <iostream>
#define USE_OPENSSL
#ifdef USE_OPENSSL
#include <openssl/opensslv.h>
#endif

using namespace std;

int main() {
    std::cout << "Hello World" << std::endl;
    std::cout << "OpenSSL version: " << OpenSSL_version_num() << std::endl;
    return 0;
}
