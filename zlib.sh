#!/bin/bash
ZLIB=zlib-1.2.11
PREFIX=$(pwd)/tmp
mkdir -p tmp/lib tmp/include tmp/bin tmp/licenses/
rm -rf /tmp/${ZLIB}
tar xf download/${ZLIB}.tar.gz -C /tmp
(
  cd /tmp/${ZLIB}
  make -f win32/Makefile.gcc PREFIX=x86_64-w64-mingw32-
  cp zlib1.dll ${PREFIX}/bin/
  cp libz.a ${PREFIX}/lib/
  cp libz.dll.a ${PREFIX}/lib/
  cp zlib.h ${PREFIX}/include/
  cp zconf.h ${PREFIX}/include/
)

mkdir -p tmp/lib/pkgconfig
echo "Name: zlib
Description: zlib
Version: 1.2.11
Libs: -L${PREFIX}/lib -lz
Cflags: -I${PREFIX}/include" > tmp/lib/pkgconfig/zlib.pc

cp licenses/${ZLIB}-LICENSE.txt tmp/licenses/
