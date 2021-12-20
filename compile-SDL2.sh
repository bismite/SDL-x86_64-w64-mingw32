#!/bin/bash
SDL2=SDL2-2.0.18
PREFIX=$(pwd)/tmp

rm -rf /tmp/${SDL2}
tar xf download/${SDL2}.tar.gz -C /tmp

(
  cd /tmp/${SDL2} ;
  ./configure --prefix=${PREFIX} --host=x86_64-w64-mingw32
  make install
  cp LICENSE.txt ${PREFIX}/licenses/${SDL2}-LICENSE.txt
)

x86_64-w64-mingw32-strip ${PREFIX}/bin/SDL2.dll
