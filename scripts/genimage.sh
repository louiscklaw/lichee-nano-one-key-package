#!/usr/bin/env bash

set -ex

OUT_FILENAME="flashimg.bin"

UBOOT_FILE=../u-boot-new/u-boot-sunxi-with-spl.bin
KERNEL_DIR=../linux
KERNEL_MODULES_DIR=$KERNEL_DIR/out/*
DTB_FILE=$KERNEL_DIR/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dtb
KERNEL_FILE=$KERNEL_DIR/arch/arm/boot/zImage
ROOTFS_FILE=../buildroot-2018.11.1/output/images/rootfs.tar
SPEC_FILE=./custom/*
SCRIPTES=./scripts/*.sh

dd if=/dev/zero of=$OUT_FILENAME bs=1M count=16
dd if=$UBOOT_FILE of=$OUT_FILENAME bs=1K conv=notrunc
dd if=$DTB_FILE of=$OUT_FILENAME bs=1K seek=448  conv=notrunc
dd if=$KERNEL_FILE of=$OUT_FILENAME bs=1K seek=512  conv=notrunc

mkdir rootfs
tar xf $ROOTFS_FILE -C ./rootfs

cp -r $KERNEL_MODULES_DIR rootfs/usr/
cp -r $SPEC_FILE rootfs/

# add some custom modify
for f in $SCRIPTES; do
    ROOTFS_PATH=./rootfs bash "$f" -H
done

fakeroot mksquashfs rootfs/ rootfs.img -no-exports -no-xattrs -all-root
fakeroot mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x400000 -o jffs2.img -d overlay/

dd if=rootfs.img of=$OUT_FILENAME  bs=1K seek=4608  conv=notrunc
dd if=jffs2.img of=$OUT_FILENAME bs=1M seek=12 conv=notrunc

rm -rf rootfs rootfs.img jffs2.img
