#!/usr/bin/env bash

if [ -z "$DOCKER_ENVIRONEMNT" ]
then
  echo "ERROR: should be launch inside docker "
  exit 1
else
  echo "checked docker environment, continue"
fi

cd /root
  cd scripts
    if [ -z "$INSTALL_BUILD_TOOLS" ]
    then
      echo "skipping install tools"
    else
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