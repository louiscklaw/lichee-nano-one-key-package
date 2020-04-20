#!/usr/bin/env bash

set -ex

cp rootfs_ws/.config/.config rootfs_ws/buildroot-2019.11.1/.config

cd rootfs_ws/buildroot-2019.11.1
  make ARCH=arm menuconfig
cd -

cp rootfs_ws/buildroot-2019.11.1/.config rootfs_ws/.config/.config