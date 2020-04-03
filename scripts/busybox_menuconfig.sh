#!/usr/bin/env bash


# /home/logic/_workspace/lichee-nano-one-key-package/rootfs_ws/buildroot-2019.11.1/output/build/busybox-1.31.1/.config
cp rootfs_ws/.config/busybox.config rootfs_ws/buildroot-2019.11.1/output/build/busybox-1.31.1/.configbusybox.config

cd rootfs_ws/buildroot-2019.11.1
  make ARCH=arm busybox-menuconfig
cd -

cp rootfs_ws/buildroot-2019.11.1/output/build/busybox-1.31.1/.config rootfs_ws/.config/busybox.config
