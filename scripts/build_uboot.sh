#!/usr/bin/env bash

set -xev

if [ -n "$DOCKER_ENVIRONEMNT" ]; then
  echo "checked docker environment, continue"
else
  echo "ERROR: should be launch inside docker "
  exit 1
fi

cd /root
  cd scripts
    if [ -n "$INSTALL_BUILD_TOOLS" ]; then
      echo "install build tools"
      ./init.sh
    else
      echo "no need to install build tools"
    fi
  cd ..
cd ..

cd /root
  cd uboot_ws
    ./build_uboot_spi.sh
  cd ..
cd ..

echo "uboot done"