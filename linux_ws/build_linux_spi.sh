#!/usr/bin/env bash

# rm -rf $LINUX_VER
# git clone --depth=1 -b f1c100s-480272lcd-test https://github.com/Icenowy/linux.git



set -xev

export PATH=$PWD/../toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

LINUX_VER=linux_5_2

# cp .config.spi.origional linux/.config

# make ARCH=arm menuconfig
# # copy back to save the updated configuration file
# cp linux/.config .config.spi.origional

# sudo rm -rf ../output/zImage
# sudo rm -rf ../output/suniv-f1c100s-licheepi-nano.dtb

# printf "\nlist rootfs modules directory before build\n"
# ls -l ../output/rootfs/lib

if [ -z "$RENEW_GIT_SOURCE" ]
then
  echo "skipping renew git source (RENEW_GIT_SOURCE)"

else
  rm -rf linux_5_2
  git clone -b nano-5.2-flash --depth=1 https://github.com/Lichee-Pi/linux.git  linux_5_2
fi

rm -rf $LINUX_VER/arch/arm/boot/zImage

# cp ./dts_file/suniv-f1c100s-licheepi-nano.dts ./linux_5_2/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts

cp ./dts_file/suniv-f1c100s.dtsi ./linux_5_2/arch/arm/boot/dts/suniv-f1c100s.dtsi
cp ./dts_file/suniv-f1c100s-licheepi-nano.dts ./linux_5_2/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts

chown 1000:1000 -R ./dts_file

cd $LINUX_VER
  cp ../.config/.config_linux_5_2 .config

  # LINUX_VER=linux_4_15


  # printf "\nclean workspace\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8 clean

  # rm -rf arch/arm/boot/zImage
  # ls -lh arch/arm/boot/zImage

  # rm -rf arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb
  # ls -lh arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb

  # # rm -rf drivers/net/wireless/esp8089_driver/esp8089.ko
  # # ls -lh drivers/net/wireless/esp8089_driver/esp8089.ko

  # printf "\nbuild linux\n"
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6

  # printf "\nlist output zImage\n"
  ls -lh arch/arm/boot/zImage

  # # /home/logic/_del/lichee-nano-one-key-package/linux_ws/linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
  # printf "\nbuild dts\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j6

  cp ./.config ../.config/.config_spi_backup
  cp ./.config ../.config/.config
  chown 1000:1000 ./.config
  chown 1000:1000 -R ../.config

cd ..

cp $LINUX_VER/arch/arm/boot/zImage ../output
md5sum $LINUX_VER/arch/arm/boot/zImage

# cp $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb ../output
# md5sum $LINUX_VER/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb



cd $LINUX_VER
  printf "\nmodules\n"
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules -j6
  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules_install -j6 INSTALL_MOD_PATH=../../output/rootfs/

  # make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j6

  OUT=../../output/esp8089_out

  rm -rf $OUT
  mkdir -p $OUT

  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j INSTALL_MOD_PATH=$OUT modules
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j INSTALL_MOD_PATH=$OUT modules_install

  # extra ?
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j M=../../esp8089_ws/esp8089 CONFIG_ESP8089=m INSTALL_MOD_PATH=$OUT modules
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j M=../../esp8089_ws/esp8089 CONFIG_ESP8089=m INSTALL_MOD_PATH=$OUT modules_install

cd ..



# cp -r ../esp8089_ws/esp8089_driver/firmware ../output/rootfs/lib/firmware
# rsync -a -L ../output/esp8089/ ../output/rootfs

# cp $LINUX_VER/drivers/net/wireless/esp8089_driver/esp8089.ko ../output
# md5sum $LINUX_VER/drivers/net/wireless/esp8089_driver/esp8089.ko

exit 0