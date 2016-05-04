#include <stdint.h>

//
// Yappy - Initialize
//
bool YappyInit();

//
// Yappy - UnCompress
//
size_t YappyGetRequiredUnCompressSize(size_t sizeRealSize);
unsigned char* YappyUnCompress(const unsigned char* data, const unsigned char* end, unsigned char* to);
unsigned char* YappyUnCompressSafe(const unsigned char* pbySource, const unsigned char* pbySourceEnd, unsigned char* pbyDestination, const unsigned char* pbyDestinationEnd  );

//
// Yappy - Compress
//
unsigned char* YappyCompress(const unsigned char* data, unsigned char* to, size_t len, int level);
