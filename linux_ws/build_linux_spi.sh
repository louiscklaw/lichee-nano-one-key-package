#!/usr/bin/env bash

# rm -rf $LINUX_VER
# git clone --depth=1 -b f1c100s-480272lcd-test https://github.com/Icenowy/linux.git

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

LINUX_VER=linux_5_2
# LINUX_VER=linux_4_15


# cp .config.spi.origional linux/.config

# make ARCH=arm menuconfig
# # copy back to save the updated configuration file
# cp linux/.config .config.spi.origional

# sudo rm -rf ../output/zImage
# sudo rm -rf ../output/suniv-f1c100s-licheepi-nano.dtb

printf "\nlist rootfs modules directory before build\n"
ls -l ../output/rootfs/lib

cd $LINUX_VER
  # printf "\nclean workspace\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8 clean

  # rm -rf arch/arm/boot/zImage
  # ls -lh arch/arm/boot/zImage

  # rm -rf arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb
  # ls -lh arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

  # # rm -rf drivers/net/wireless/esp8089_driver/esp8089.ko
  # # ls -lh drivers/net/wireless/esp8089_driver/esp8089.ko

  # printf "\nbuild linux\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6

  # printf "\nlist output zImage\n"
  # ls -lh arch/arm/boot/zImage

  # # /home/logic/_del/lichee-nano-one-key-package/linux_ws/linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
  # printf "\nbuild dts\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j6

  printf "\nmodules\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules -j6
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules_install -j6 INSTALL_MOD_PATH=../../output/rootfs/

  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6 INSTALL_MOD_PATH=../../output/esp8089/ modules
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6 INSTALL_MOD_PATH=../../output/esp8089/ modules_install

  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j M=../esp8089 CONFIG_ESP8089=m INSTALL_MOD_PATH=out modules
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j M=../esp8089 CONFIG_ESP8089=m INSTALL_MOD_PATH=out modules_install

  cp ./.config ../.config_spi_backup
cd ..

cp $LINUX_VER/arch/arm/boot/zImage ../output
md5sum $LINUX_VER/arch/arm/boot/zImage

cp $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb ../output
md5sum $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

# cp -r ../esp8089_ws/esp8089_driver/firmware ../output/rootfs/lib/firmware
# rsync -a -L ../output/esp8089/ ../output/rootfs

# cp $LINUX_VER/drivers/net/wireless/esp8089_driver/esp8089.ko ../output
# md5sum $LINUX_VER/drivers/net/wireless/esp8089_driver/esp8089.ko

exit 0