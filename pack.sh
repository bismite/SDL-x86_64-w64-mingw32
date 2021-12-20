#!/bin/bash

rm -rf build
mkdir -p build
( cd build ; mkdir -p bin include lib licenses )
LOC=$(pwd)/build

(
  cd tmp/bin
  cp SDL2.dll SDL2_image.dll SDL2_mixer.dll libmpg123-0.dll libpng.dll libz.dll ${LOC}/bin/
)
(
  cd tmp/lib
  cp libSDL2.a libSDL2_image.a libSDL2_image-static.a libSDL2_mixer.a libSDL2main.a libpng.a libz.a ${LOC}/lib/
)
(
  cd tmp/include
  cp -R SDL2/ ${LOC}/include/
)
cp -R tmp/licenses/* ./build/licenses/

tar czf SDL-x86_64-w64-mingw32.tgz build/
