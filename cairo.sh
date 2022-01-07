#!/bin/bash
CAIRO=cairo-1.17.4
PREFIX=$(pwd)/tmp

DISABLES="--enable-static=no --disable-interpreter --disable-svg --disable-ps --disable-pdf --disable-xlib --disable-xlib-xrender --disable-win32-font"

rm -rf /tmp/${CAIRO}
tar xf download/${CAIRO}.tar.xz -C /tmp
(
  cd /tmp/${CAIRO}
  ./configure --prefix=${PREFIX} --host=x86_64-w64-mingw32 ${DISABLES} \
    CFLAGS="-Wall -O2 -g0 -D_FORTIFY_SOURCE=0 -DNDEBUG -I${PREFIX}/include" \
    LDFLAGS="-L${PREFIX}/lib -static-libstdc++ -static-libgcc -lpixman-1" \
    PKG_CONFIG=${PREFIX}/bin/pkg-config
  make install V=1
)

cp /tmp/${CAIRO}/COPYING tmp/licenses/${CAIRO}-COPYING
cp /tmp/${CAIRO}/COPYING-LGPL-2.1 tmp/licenses/${CAIRO}-COPYING-LGPL-2.1
cp /tmp/${CAIRO}/COPYING-MPL-1.1 tmp/licenses/${CAIRO}-COPYING-MPL-1.1
