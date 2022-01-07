#!/bin/bash
PIXMAN=pixman-0.40.0
PREFIX=$(pwd)/tmp

rm -rf /tmp/${PIXMAN}
tar xf download/${PIXMAN}.tar.gz -C /tmp

(
  cd /tmp/${PIXMAN}
  ./configure --prefix=${PREFIX} --enable-libpng=yes --enable-shared --enable-static --host=x86_64-w64-mingw32 \
    PKG_CONFIG=${PREFIX}/bin/pkg-config
  make install V=1 SUBDIRS=pixman

  x86_64-w64-mingw32-gcc pixman/*.o -shared -o ${PREFIX}/bin/libpixman-1-0.dll -static-libgcc -static-libstdc++
  x86_64-w64-mingw32-strip ${PREFIX}/bin/libpixman-1-0.dll
)

cp /tmp/${PIXMAN}/COPYING tmp/licenses/${PIXMAN}-COPYING
