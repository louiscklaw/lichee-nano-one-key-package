#!/usr/bin/env bash

cp uboot_ws/.config/.config uboot_ws/u-boot/.config

cd uboot_ws/u-boot
  make ARCH=arm menuconfig
cd -

cp uboot_ws/u-boot/.config uboot_ws/.config/.config