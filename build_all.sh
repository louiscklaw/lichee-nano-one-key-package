#!/usr/bin/env bash

cd uboot_ws
  ./build_uboot_spi.sh
cd ..

cd rootfs_ws
  ./build_rootfs_spi.sh
cd ..

cd linux_ws
  ./build_linux_spi.sh
cd ..