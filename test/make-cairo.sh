#!/bin/bash

mkdir -p tmp/test-cairo
cp test/gohufont-14.bdf tmp/test-cairo/ 
(
  cd tmp/test-cairo
  x86_64-w64-mingw32-gcc -Wall ../../test/test-cairo.c -o test-cairo.exe \
    -I ../include/pixman-1 -I ../include/cairo -I ../include/freetype2 -L ../bin \
    -lpixman-1-0 -lcairo-2 -lfreetype-6 -static-libgcc -static-libstdc++
  cp ../bin/*.dll ./
)
