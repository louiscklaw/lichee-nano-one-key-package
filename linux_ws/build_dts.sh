#!/usr/bin/env bash

set -vex

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

LINUX_VER=linux_5_2


cp ./dts_file/suniv-f1c100s-licheepi-nano.dts ./linux_5_2/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts

cd $LINUX_VER
  rm -rf arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j6

  ls -lh arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb
cd ..

cp $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb ../output
md5sum $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb


# done

exit 0