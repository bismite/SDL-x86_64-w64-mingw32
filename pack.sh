#!/bin/bash

DIR=SDL-x86_64-w64-mingw32
SDL2=SDL2-2.0.16
SDL2_MIXER=SDL2_mixer-2.0.4
SDL2_IMAGE=SDL2_image-2.0.5

mkdir -p ${DIR}/lib ${DIR}/include ${DIR}/bin ${DIR}/licenses

# SDL2
cp -R ${SDL2}/x86_64-w64-mingw32/include ${DIR}/
for i in libSDL2main.a libSDL2.dll.a; do
  cp -R ${SDL2}/x86_64-w64-mingw32/lib/libSDL2.dll.a ${DIR}/lib/
done
cp -R ${SDL2}/x86_64-w64-mingw32/bin/SDL2.dll ${DIR}/bin/
cp -R ${SDL2}/COPYING.txt ${DIR}/licenses/COPYING-${SDL2}.txt

# SDL2_mixer
cp -R ${SDL2_MIXER}/x86_64-w64-mingw32/include ${DIR}/
cp -R ${SDL2_MIXER}/x86_64-w64-mingw32/lib/libSDL2_mixer.dll.a ${DIR}/lib/
for i in SDL2_mixer.dll libmpg123-0.dll; do
  cp -R ${SDL2_MIXER}/x86_64-w64-mingw32/bin/$i ${DIR}/bin/
done
cp -R ${SDL2_MIXER}/COPYING.txt ${DIR}/licenses/COPYING-${SDL2_MIXER}.txt
cp -R ${SDL2_MIXER}/x86_64-w64-mingw32/bin/LICENSE.mpg123.txt ${DIR}/licenses/

# SDL2_image
cp -R ${SDL2_IMAGE}/x86_64-w64-mingw32/include ${DIR}/
cp -R ${SDL2_IMAGE}/x86_64-w64-mingw32/lib/libSDL2_image.dll.a ${DIR}/lib/
for i in SDL2_image.dll libpng16-16.dll zlib1.dll; do
  cp -R ${SDL2_IMAGE}/x86_64-w64-mingw32/bin/$i ${DIR}/bin/
done
cp -R ${SDL2_IMAGE}/COPYING.txt ${DIR}/licenses/COPYING-${SDL2_IMAGE}.txt
cp -R ${SDL2_IMAGE}/x86_64-w64-mingw32/bin/LICENSE.png.txt ${DIR}/licenses
cp -R ${SDL2_IMAGE}/x86_64-w64-mingw32/bin/LICENSE.zlib.txt ${DIR}/licenses

#
tar czf ${DIR}.tgz ${DIR}/
