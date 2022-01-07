#!/bin/bash

(
  cd tmp
  tar czf cairo-x86_64-w64-mingw32.tgz \
    bin/libfreetype-6.dll bin/libpixman-1-0.dll bin/libcairo-2.dll \
    bin/libpng16.dll bin/zlib1.dll \
    include/cairo include/freetype2 include/pixman-1 \
    include/png.h include/pngconf.h include/pnglibconf.h include/zconf.h include/zlib.h \
    licenses/cairo-1.17.4-COPYING licenses/cairo-1.17.4-COPYING-LGPL-2.1 licenses/cairo-1.17.4-COPYING-MPL-1.1 \
    licenses/freetype-2.11.1-LICENSE.TXT licenses/pixman-0.40.0-COPYING \
    licenses/libpng-1.6.37-LICENSE.txt licenses/zlib-1.2.11-LICENSE.txt
)
