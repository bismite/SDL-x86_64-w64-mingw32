#!/bin/bash

(
  cd tmp
  tar czf SDL-x86_64-w64-mingw32.tgz \
    bin/SDL2.dll bin/SDL2_image.dll bin/SDL2_mixer.dll bin/libmpg123-0.dll \
    bin/libpng16.dll bin/zlib1.dll \
    lib/libSDL2.a lib/libSDL2_image.a lib/libSDL2_image-static.a lib/libSDL2_mixer.a lib/libSDL2main.a \
    lib/libpng.a lib/libz.a \
    include/SDL2 \
    licenses/
)
