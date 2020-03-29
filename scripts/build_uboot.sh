#!/usr/bin/env bash

if [ -n "$DOCKER_ENVIRONEMNT" ]; then
  echo "checked docker environment, continue"
else
  echo "ERROR: should be launch inside docker "
  exit 1
fi

cd /root
  cd scripts
    if [ -n "$INSTALL_BUILD_TOOLS" ]; then
      ./init.sh > init.log
    fi
  cd ..
cd ..

cd /root
  cd uboot_ws
    ./build_uboot_spi.sh > build_uboot.log
  cd ..
cd ..

echo "uboot done"