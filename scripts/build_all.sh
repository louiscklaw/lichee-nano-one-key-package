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
    ./init.sh | tee init.log

    ./build_dts.sh | tee build_dts.log &
    ./build_zImage.sh | tee build_zImage.log &
    ./build_rootfs.sh | tee build_rootfs.log &
    ./build_uboot.sh  | tee build_uboot.log &

    wait


  cd ..


cd ..

echo "build all done"

# done