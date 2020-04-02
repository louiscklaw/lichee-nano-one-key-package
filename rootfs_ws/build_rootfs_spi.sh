#!/usr/bin/env bash

set -xe

BUILD_ROOT_VER=buildroot-2019.11.1
# BUILD_ROOT_VER=buildroot-2017.08

# start building rootfs

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

if [ -n "$DOWNLOAD_BUILDROOT" ]
then
  echo "download buildroot"
  wget https://buildroot.org/downloads/$BUILD_ROOT_VER.tar.gz
  tar xvf $BUILD_ROOT_VER.tar.gz
  rm -rf $BUILD_ROOT_VER.tar.gz
fi

# wget https://buildroot.org/downloads/buildroot-2017.08.tar.gz
# rm -rf rootfs_ws/buildroot-2019.11.1
# wget https://buildroot.org/downloads/$BUILD_ROOT_VER.tar.gz
# tar xvf $BUILD_ROOT_VER.tar.gz
# cd buildroot-2019.11.1/
# make menuconfig

# cp .config.spi_try $BUILD_ROOT_VER/.config

sudo rm -rf ../output/rootfs.tar

# echo "CLEAR_WORKSPACE_BEFORE_BUILD checking... "
# if [ -z "$CLEAR_WORKSPACE_BEFORE_BUILD" ]
# then
#   echo "skipping cleaning for rootfs"
# else
#   # cd $BUILD_ROOT_VER
#   #   printf "\ncleaning...\n"
#   #   make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- clean -j20
#   # cd ..
# fi


cd $BUILD_ROOT_VER
  # start buildroot

  # copy config
  cp ../.config/.config_spi_backup .config
  chown 1000:1000 .config

  mkdir -p ./package/busybox
  cp ../.config/busybox.config ./package/busybox/busybox.config
  chown 1000:1000 ./package/busybox/busybox.config

  # compile new copy
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-


  chown 1000:1000 -R .
cd -

# check new file exists ?
ls -lh $BUILD_ROOT_VER/output/images/rootfs.tar

# update rootfs.tar in output directory
cp $BUILD_ROOT_VER/output/images/rootfs.tar ../output

# compile complete, backup current config
cp ./$BUILD_ROOT_VER/.config ./.config/.config_spi_backup

chown 1000:1000 -R $BUILD_ROOT_VER

# goto project root directory
cd /root

# move rootfs.tar to output directory
cd output

  sudo rm -rf ./rootfs
  mkdir -p rootfs
  sudo tar xf rootfs.tar -C ./rootfs

  sudo rm -rf ./jffs2.img
  # sudo rm rootfs.tar
cd -
