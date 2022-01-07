#!/bin/bash
FREETYPE=freetype-2.11.1
PREFIX=$(pwd)/tmp
DISABLES="--disable-static --with-bzip2=no --with-brotli=no --with-harfbuzz=no"
rm -rf /tmp/${FREETYPE}
tar xf download/${FREETYPE}.tar.xz -C /tmp
(
  cd /tmp/${FREETYPE}
  # env ZLIB_CFLAGS="-I${PREFIX}/include" ZLIB_LIBS="-L${PREFIX}/bin -lz" LIBPNG_CFLAGS="-I${PREFIX}/include" LIBPNG_LIBS="-L${PREFIX}/bin -lpng16" ./configure --prefix=${PREFIX} --disable-static --host=x86_64-w64-mingw32 --with-bzip2=no --with-brotli=no --with-harfbuzz=no
  PKG_CONFIG=${PREFIX}/bin/pkg-config ./configure --prefix=${PREFIX} --host=x86_64-w64-mingw32 ${DISABLES}
  make install
)

cp /tmp/${FREETYPE}/LICENSE.TXT tmp/licenses/${FREETYPE}-LICENSE.TXT
