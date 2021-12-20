#!/bin/bash
PREFIX=$(pwd)/../build

rm -rf build build-static
mkdir -p build build-static
cp sample.png sample.mp3 build
cp sample.png sample.mp3 build-static

(
  cd build-static
  x86_64-w64-mingw32-gcc -Wall ../sample.c -o sample.exe \
    -I ${PREFIX}/include/SDL2 -Dmain=SDL_main \
    -L ${PREFIX}/lib \
    -lSDL2_image-static -lSDL2_mixer -lpng -lz \
    -lmingw32 -lSDL2main -lSDL2 -mwindows -Wl,--dynamicbase -Wl,--nxcompat -Wl,--high-entropy-va -lm -ldinput8 -ldxguid -ldxerr8 -luser32 -lgdi32 -lwinmm -limm32 -lole32 -loleaut32 -lshell32 -lsetupapi -lversion -luuid
  x86_64-w64-mingw32-strip sample.exe
  cp ${PREFIX}/bin/libmpg123-0.dll ./
)
(
  cd build
  x86_64-w64-mingw32-gcc -Wall ../sample.c -o sample.exe \
    -I ${PREFIX}/include/SDL2 -L ${PREFIX}/bin -L ${PREFIX}/lib \
    -Dmain=SDL_main -lmingw32 -lSDL2main -lSDL2 -mwindows -lSDL2_image -lSDL2_mixer
  cp ${PREFIX}/bin/*.dll ./
)
