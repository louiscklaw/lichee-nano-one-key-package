#!/usr/bin/env bash

# rm -rf linux
# git clone --depth=1 -b f1c100s-480272lcd-test https://github.com/Icenowy/linux.git

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

# cp .config.spi.origional linux/.config

# make ARCH=arm menuconfig
# # copy back to save the updated configuration file
# cp linux/.config .config.spi.origional

sudo rm -rf ../output/zImage
sudo rm -rf ../output/suniv-f1c100s-licheepi-nano.dtb

cd linux
  printf "\nclean workspace\n"
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8 clean

  rm -rf arch/arm/boot/zImage
  ls -lh arch/arm/boot/zImage

  rm -rf arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb
  ls -lh arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

  printf "\nbuild linux\n"
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j7

  printf "\nlist output zImage\n"
  ls -lh arch/arm/boot/zImage

  # /home/logic/_del/lichee-nano-one-key-package/linux_ws/linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
  printf "\nbuild dts\n"
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j7

cd ..

cp linux/arch/arm/boot/zImage ../output
md5sum linux/arch/arm/boot/zImage

cp linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb ../output
md5sum linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

exit 0