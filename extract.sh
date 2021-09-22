#!/bin/bash


for tgz in \
  SDL2-devel-2.0.16-mingw.tar.gz \
  SDL2_image-devel-2.0.5-mingw.tar.gz \
  SDL2_mixer-devel-2.0.4-mingw.tar.gz
do
  echo $tgz
  tar zxf $tgz
done
