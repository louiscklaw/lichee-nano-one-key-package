#!/usr/bin/env bash

set -xe

BUILD_ROOT_VER=buildroot-2019.11.1


# backup uboot
cp uboot_ws/u-boot/.config uboot_ws/.config/.config

# backup linux/zImage/kernel
cp linux_ws/linux_5_2/.config linux_ws/.config/.config

# backup rootfs_ws
cp rootfs_ws/$BUILD_ROOT_VER/.config rootfs_ws/.config/.config
cp rootfs_ws/$BUILD_ROOT_VER/package/busybox/busybox.config rootfs_ws/.config/busybox.config

echo "backup done"