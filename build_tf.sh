#!/usr/bin/env bash

echo "start build spi flash"
export PATH=$PWD/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

# apt-get update
# apt-get install -y git sudo wget tmux
# sudo apt-get install -y autoconf automake libtool gettext
# sudo apt-get install -y make gcc g++ swig python-dev bc python u-boot-tools bison flex bc libssl-dev libncurses5-dev unzip mtd-utils
# sudo apt-get install -y libc6-i386 lib32stdc++6 lib32z1
# # sudo apt-get install -y libc6 lib32stdc++6 lib32z1
# sudo apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386
# sudo apt-get install -y rsync cpio

echo ""
echo "build uboot"
# http://nano.lichee.pro/build_sys/bootargs.html
cd uboot_ws
  bash uboot_ws/build_uboot.sh
cd ..

echo ""
echo "build linux"
cd linux_ws
  bash linux_ws/build_linux.sh
cd ..

echo ""
echo "build rootfs"
cd rootfs_ws
  bash rootfs_ws/build_rootfs.sh
cd ..