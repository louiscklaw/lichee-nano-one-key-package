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
  cd rootfs_ws
    ./build_rootfs_spi.sh
  cd ..
cd ..

echo "rootfs done"