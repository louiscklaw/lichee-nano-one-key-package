#!/usr/bin/env bash

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

git clone https://github.com/Lichee-Pi/u-boot.git -b nano-v2018.01

cd u-boot

  printf "\nclear old copy\n"
  rm -rf u-boot-sunxi-with-spl.bin
  ls -lh u-boot-sunxi-with-spl.bin

  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- licheepi_nano_spiflash_defconfig

  # make ARCH=arm menuconfig
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j4

  # list output file
  printf "\nlist output file\n"
  ls -lh u-boot-sunxi-with-spl.bin

cd ..


printf "\nclear old boot.scr\n"
rm -rf boot.scr
ls -l boot.scr

printf "\nregen boot.scr\n"
mkimage -C none -A arm -T script -d boot.cmd boot.scr

ls -l boot.scr

printf "\nboot.scr done\n"

cp boot.scr ../output

exit 0