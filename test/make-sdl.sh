#!/bin/bash
PREFIX=$(pwd)/tmp
mkdir -p tmp/test-sdl tmp/test-sdl-static
cp test/sample.png test/sample.mp3 tmp/test-sdl
cp test/sample.png test/sample.mp3 tmp/test-sdl-static
(
  cd tmp/test-sdl-static
  x86_64-w64-mingw32-gcc -Wall ../../test/test-sdl.c ${PREFIX}/lib/libSDL2.a -o test-sdl.exe \
    -I ${PREFIX}/include/SDL2 -Dmain=SDL_main \
    -L ${PREFIX}/lib \
    -lSDL2_image-static -lSDL2_mixer -lpng ${PREFIX}/lib/libz.a \
    -lmingw32 -lSDL2main  -mwindows -Wl,--dynamicbase -Wl,--nxcompat -Wl,--high-entropy-va -lm -ldinput8 -ldxguid -ldxerr8 -luser32 -lgdi32 -lwinmm -limm32 -lole32 -loleaut32 -lshell32 -lsetupapi -lversion -luuid
  x86_64-w64-mingw32-strip test-sdl.exe
  cp ${PREFIX}/bin/libmpg123-0.dll ./
)
(
  cd tmp/test-sdl
  x86_64-w64-mingw32-gcc -Wall ../../test/test-sdl.c -o test-sdl.exe \
    -I ${PREFIX}/include/SDL2 -L ${PREFIX}/bin -L ${PREFIX}/lib \
    -Dmain=SDL_main -lmingw32 -lSDL2main -lSDL2 -mwindows -lSDL2_image -lSDL2_mixer
  cp ${PREFIX}/bin/*.dll ./
)
