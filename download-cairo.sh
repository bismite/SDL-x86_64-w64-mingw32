#!/bin/bash

mkdir download

for url in \
  https://download.sourceforge.net/libpng/libpng-1.6.37.tar.gz \
  https://zlib.net/zlib-1.2.11.tar.gz \
  https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz \
  https://cairographics.org/snapshots/cairo-1.17.4.tar.xz \
  https://cairographics.org/releases/pixman-0.40.0.tar.gz \
  https://download.savannah.gnu.org/releases/freetype/freetype-2.11.1.tar.xz
do
  echo $url
  (cd download ; wget -N --content-disposition $url)
done
