#!/usr/bin/env bash

set -xe

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
  cd linux_ws
    ./build_linux_spi.sh > build_linux_spi.log
  cd ..
cd ..

echo "kernel/zImage/linux done"