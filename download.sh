#!/bin/bash

for url in \
  https://www.libsdl.org/release/SDL2-devel-2.0.16-mingw.tar.gz \
  https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.5-mingw.tar.gz \
  https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-2.0.4-mingw.tar.gz
do
  echo $url
  curl "-JOL#" $url
done
