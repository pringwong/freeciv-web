#!/bin/bash

# freeciv
mkdir -p build

( cd build
  meson setup ../freeciv -Dserver='freeciv-web' -Dclients=[] -Dfcmp=cli \
          -Djson-protocol=true -Dnls=false -Daudio=false -Druledit=false \
          -Ddefault_library=static -Dprefix=/home/docker/freeciv \
          -Doptimization=3
  ninja
)
ninja install
echo "done"

# freeciv-web
cd /docker/freeciv-web/; sh build.sh