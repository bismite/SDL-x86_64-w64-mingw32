#!/bin/bash
ZLIB=zlib-1.2.11
PREFIX=$(pwd)/tmp

rm -rf /tmp/${ZLIB}
tar xf download/${ZLIB}.tar.gz -C /tmp

CFILES="adler32.c compress.c crc32.c deflate.c gzclose.c gzlib.c gzread.c gzwrite.c infback.c inffast.c inflate.c inftrees.c trees.c uncompr.c zutil.c"
(
  cd /tmp/${ZLIB}
  x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -c ${CFILES}
  x86_64-w64-mingw32-ar rcs libz.a *.o
  x86_64-w64-mingw32-gcc -shared -o libz.dll *.o
  x86_64-w64-mingw32-strip libz.dll
  cp libz.dll ${PREFIX}/bin
  cp libz.a ${PREFIX}/lib
  cp zlib.h ${PREFIX}/include
  cp zconf.h ${PREFIX}/include
)

cp licenses/${ZLIB}-LICENSE.txt tmp/licenses/
