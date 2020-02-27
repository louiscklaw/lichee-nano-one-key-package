#!/usr/bin/env bash

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

# git clone https://github.com/Lichee-Pi/u-boot.git -b nano-v2018.01
# git clone --depth=1 -b nano-v2018.01 https://github.com/Lichee-Pi/u-boot.git

sudo rm -rf ../output/u-boot-sunxi-with-spl.bin

cd u-boot

  printf "\nclear old copy\n"
  rm -rf u-boot-sunxi-with-spl.bin
  ls -lh u-boot-sunxi-with-spl.bin

  # cp ../.config_spi ./.config

  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- licheepi_nano_spiflash_defconfig

  # make ARCH=arm menuconfig
  # cp ./.config ../.config_spi
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6

  # list output file
  printf "\nlist output file\n"
  ls -lh u-boot-sunxi-with-spl.bin

  cp ./.config ../.config_spi_backup

cd ..

cp u-boot/u-boot-sunxi-with-spl.bin ../output

exit 0