#!/bin/bash
SDL2_MIXER=SDL2_mixer-2.0.4
PREFIX=$(pwd)/tmp

# mpg123
(
  cd download
  rm -rf mpg123-1.29.3-x86-64
  unzip mpg123-1.29.3-x86-64.zip
  (
    cd mpg123-1.29.3-x86-64
    cp libmpg123-0.dll ${PREFIX}/bin/
    cp mpg123.h ${PREFIX}/include/
    cp fmt123.h ${PREFIX}/include/
    cp COPYING.txt ${PREFIX}/licenses/mpg123-1.29.3-COPYING.txt
  )
)

# SDL2_mixer
rm -rf /tmp/${SDL2_MIXER}
tar xf download/${SDL2_MIXER}.tar.gz -C /tmp
(
  cd /tmp/${SDL2_MIXER} ;
  rm -f playmus.c playwave.c
  x86_64-w64-mingw32-gcc -Wall -O3 -DNDEBUG -DMUSIC_MP3_MPG123 -DMPG123_DYNAMIC="\"libmpg123-0.dll\"" -c *.c -I ${PREFIX}/include -I ${PREFIX}/include/SDL2
  x86_64-w64-mingw32-ar rcs libSDL2_mixer.a *.o
  x86_64-w64-mingw32-gcc -shared -o SDL2_mixer.dll *.o -L ${PREFIX}/bin -L ${PREFIX}/lib -lSDL2
  x86_64-w64-mingw32-strip SDL2_mixer.dll
  cp SDL2_mixer.dll ${PREFIX}/bin/
  cp libSDL2_mixer.a ${PREFIX}/lib/
  cp SDL_mixer.h ${PREFIX}/include/SDL2/
  cp COPYING.txt ${PREFIX}/licenses/${SDL2_MIXER}-COPYING.txt
)
