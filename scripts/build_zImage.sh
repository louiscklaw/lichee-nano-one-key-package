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
  cd linux_ws
    ./build_linux_spi.sh
  cd ..
cd ..

echo "kernel/zImage/linux done"