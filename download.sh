#!/bin/bash

mkdir download

for url in \
  https://www.libsdl.org/release/SDL2-2.0.18.tar.gz \
  https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz \
  https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz \
  http://mpg123.de/download/win64/1.29.3/mpg123-1.29.3-x86-64.zip \
  https://download.sourceforge.net/libpng/libpng-1.6.37.tar.gz \
  https://zlib.net/zlib-1.2.11.tar.gz
do
  echo $url
  (cd download ; wget -N --content-disposition $url)
done
