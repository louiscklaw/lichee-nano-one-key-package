#!/usr/bin/env bash

printf "\nstart building rootfs\n"

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

# wget https://buildroot.org/downloads/buildroot-2017.08.tar.gz
# tar xvf buildroot-2017.08.tar.gz
# cd buildroot-2017.08/
# make menuconfig


cp .config.last_know_good buildroot-2017.08/.config

cd buildroot-2017.08
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- clean
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-
cd ..

ls -lh buildroot-2017.08/output/images/rootfs.tar

printf "\nupdate rootfs.tar in output directory\n"
cp buildroot-2017.08/output/images/rootfs.tar ../output

cp buildroot-2017.08/.config .config.last_know_good