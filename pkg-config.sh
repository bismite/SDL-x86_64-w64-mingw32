#!/bin/bash
PKG_CONFIG=pkg-config-0.29.2
PREFIX=$(pwd)/tmp
mkdir -p tmp/lib tmp/include tmp/bin tmp/licenses/
tar xf download/${PKG_CONFIG}.tar.gz -C /tmp
(
  cd /tmp/${PKG_CONFIG}
  ./configure --prefix=${PREFIX} --with-internal-glib
  make install
)
