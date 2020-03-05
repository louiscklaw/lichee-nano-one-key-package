#!/usr/bin/env bash

LINUX_VER=linux_5_2

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

md5sum $LINUX_VER/esp8089.ko
rm -rf $LINUX_VER/esp8089.ko
ls -lh $LINUX_VER/esp8089.ko

cd esp8089_driver

  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C ../../linux_ws/linux M=${PWD}  modules
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6 -C ../../linux_ws/linux M=${PWD}  modules
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6 -C ../../linux_ws/$LINUX_VER M=${PWD}  modules
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j
cd ..

md5sum $LINUX_VER/esp8089.ko
ls -lh $LINUX_VER/esp8089.ko

cp $LINUX_VER/esp8089.ko ../output/esp8089.ko