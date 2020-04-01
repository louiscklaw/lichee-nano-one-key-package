#!/usr/bin/env bash

set -xe

BUILD_ROOT_VER=buildroot-2019.11.1
# BUILD_ROOT_VER=buildroot-2017.08

# start building rootfs

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

# wget https://buildroot.org/downloads/buildroot-2017.08.tar.gz
# rm -rf rootfs_ws/buildroot-2019.11.1
# wget https://buildroot.org/downloads/$BUILD_ROOT_VER.tar.gz
# tar xvf $BUILD_ROOT_VER.tar.gz
# cd buildroot-2019.11.1/
# make menuconfig

# cp .config.spi_try $BUILD_ROOT_VER/.config

sudo rm -rf ../output/rootfs.tar

echo "CLEAR_WORKSPACE_BEFORE_BUILD checking... "
if [ -z "$CLEAR_WORKSPACE_BEFORE_BUILD" ]
then
  echo "skipping cleaning for rootfs"
else
  cd $BUILD_ROOT_VER
    printf "\ncleaning...\n"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- clean -j20

  cd ..
fi

# update make config before build
  cd $BUILD_ROOT_VER
    cp ../.config/.config ./.config
    cp ../.config/.config_busybox package/busybox/busybox.config
  cd ..

exit 1

cd $BUILD_ROOT_VER
  printf "\ncompile new copy\n"
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-

cd ..

printf "\ncheck new file exists ?\n"
ls -lh $BUILD_ROOT_VER/output/images/rootfs.tar

printf "\nupdate rootfs.tar in output directory\n"
cp $BUILD_ROOT_VER/output/images/rootfs.tar ../output

printf "\ncompile complete, backup current config\n"
cp ./$BUILD_ROOT_VER/.config ../.config_spi_backup

# goto project root directory
cd ..

printf "\nmove rootfs.tar to output directory\n"
cd output

  sudo rm -rf ./rootfs
  sudo rm -rf ./jffs2.img

  mkdir -p rootfs

  sudo tar xf rootfs.tar -C ./rootfs
  # sudo rm rootfs.tar
cd ..
