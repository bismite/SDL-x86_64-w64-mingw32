#!/bin/bash
LIBPNG=libpng-1.6.37
PREFIX=$(pwd)/tmp
mkdir -p tmp/lib tmp/include tmp/bin tmp/licenses/
rm -rf /tmp/${LIBPNG}
tar xf download/${LIBPNG}.tar.gz -C /tmp

CFILES="intel/intel_init.c intel/filter_sse2_intrinsics.c png.c pngerror.c pngget.c pngmem.c pngpread.c pngread.c pngrio.c pngrtran.c pngrutil.c pngset.c pngtrans.c pngwio.c pngwrite.c pngwtran.c pngwutil.c"
(
  cd /tmp/${LIBPNG}
  cp scripts/pnglibconf.h.prebuilt pnglibconf.h
  x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -DPNG_INTEL_SSE_OPT=1 -c ${CFILES} -I${PREFIX}/include
  x86_64-w64-mingw32-ar rcs libpng.a *.o
  x86_64-w64-mingw32-gcc -shared -o libpng16.dll *.o -L${PREFIX}/bin -L${PREFIX}/lib -lz
  x86_64-w64-mingw32-strip libpng16.dll
  cp libpng16.dll ${PREFIX}/bin/
  cp libpng.a ${PREFIX}/lib/
  cp png.h pngconf.h pnglibconf.h ${PREFIX}/include
  cp LICENSE ${PREFIX}/licenses/${LIBPNG}-LICENSE.txt
)

echo "Name: libpng
Description: libpng
Version: 1.6.37
Libs: -L${PREFIX}/bin -lpng16
Cflags: -I${PREFIX}/include" > tmp/lib/pkgconfig/libpng.pc
