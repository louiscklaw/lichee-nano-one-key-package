#!/usr/bin/env bash

cp rootfs_ws/.config/busybox.config rootfs_ws/buildroot-2019.11.1/package/busybox/busybox.config

cd rootfs_ws/buildroot-2019.11.1
  make ARCH=arm busybox-menuconfig
cd -

cp rootfs_ws/buildroot-2019.11.1/package/busybox/busybox.config rootfs_ws/.config/busybox.config
