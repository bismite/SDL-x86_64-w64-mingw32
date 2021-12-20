#!/bin/bash
SDL2_IMAGE=SDL2_image-2.0.5
PREFIX=$(pwd)/tmp

rm -rf /tmp/${SDL2_IMAGE}
tar xf download/${SDL2_IMAGE}.tar.gz -C /tmp

# dynamic loading
(
  cd /tmp/${SDL2_IMAGE} ;
  x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -DLOAD_PNG -DLOAD_PNG_DYNAMIC="\"libpng.dll\"" -c *.c -I ${PREFIX}/include -I ${PREFIX}/include/SDL2
  x86_64-w64-mingw32-ar rcs libSDL2_image.a *.o
  x86_64-w64-mingw32-gcc -shared -o SDL2_image.dll *.o -L ${PREFIX}/bin -L ${PREFIX}/lib -lSDL2
  x86_64-w64-mingw32-strip SDL2_image.dll
  cp SDL2_image.dll ${PREFIX}/bin/
  cp libSDL2_image.a ${PREFIX}/lib/
  cp SDL_image.h ${PREFIX}/include/SDL2/
  cp COPYING.txt ${PREFIX}/licenses/${SDL2_IMAGE}-COPYING.txt
)

# without dynamic loading
(
  cd /tmp/${SDL2_IMAGE} ;
  mkdir static-build
  (
    cd static-build
    x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -DLOAD_PNG -c ../*.c -I ${PREFIX}/include -I ${PREFIX}/include/SDL2
    x86_64-w64-mingw32-ar rcs libSDL2_image-static.a *.o
    cp libSDL2_image-static.a ${PREFIX}/lib/
  )
)
