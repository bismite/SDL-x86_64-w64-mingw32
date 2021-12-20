#!/bin/bash
LIBPNG=libpng-1.6.37
PREFIX=$(pwd)/tmp

rm -rf /tmp/${LIBPNG}
tar xf download/${LIBPNG}.tar.gz -C /tmp

CFILES="png.c pngerror.c pngget.c pngmem.c pngpread.c pngread.c pngrio.c pngrtran.c pngrutil.c pngset.c pngtrans.c pngwio.c pngwrite.c pngwtran.c pngwutil.c"
(
  cd /tmp/${LIBPNG}
  cp scripts/pnglibconf.h.prebuilt pnglibconf.h
  x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -c ${CFILES} -I${PREFIX}/include
  x86_64-w64-mingw32-ar rcs libpng.a *.o
  x86_64-w64-mingw32-gcc -shared -o libpng.dll *.o -L${PREFIX}/bin -lz
  x86_64-w64-mingw32-strip libpng.dll
  cp libpng.dll ${PREFIX}/bin/
  cp libpng.a ${PREFIX}/lib/
  cp png.h pngconf.h pnglibconf.h ${PREFIX}/include
  cp LICENSE ${PREFIX}/licenses/${LIBPNG}-LICENSE.txt
)
