#!/bin/bash

rm -rf build tmp
mkdir -p build tmp
( cd tmp ; mkdir -p bin include lib licenses )

./compile-zlib.sh
./compile-libpng.sh
./compile-SDL2.sh
./compile-SDL2_image.sh
./compile-SDL2_mixer.sh
