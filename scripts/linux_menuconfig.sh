#!/usr/bin/env bash

set -ex

cp linux_ws/.config/.config_linux_5_2 linux_ws/linux_5_2/.config

cd linux_ws/linux_5_2
  make ARCH=arm menuconfig
cd -

cp linux_ws/linux_5_2/.config linux_ws/.config/.config_linux_5_2