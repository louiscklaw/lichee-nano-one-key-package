#!/usr/bin/env bash

YOUR_ROOTFS_FILE=rootfs.tar
YOUR_IMG_FILE=flashimg.bin

cd output
  sudo rm -rf $YOUR_IMG_FILE
  sudo rm -rf ./rootfs

  sudo dd if=/dev/zero of=$YOUR_IMG_FILE bs=1M count=16

  sudo dd if=u-boot-sunxi-with-spl.bin of=$YOUR_IMG_FILE bs=1K conv=notrunc

  sudo dd if=suniv-f1c100s-licheepi-nano.dtb of=$YOUR_IMG_FILE bs=1K seek=1024  conv=notrunc
  sudo dd if=zImage of=$YOUR_IMG_FILE bs=1K seek=1088  conv=notrunc

  # # 为根文件系统制作jffs2镜像包
  # # --pad参数指定 jffs2大小
  # # 由此计算得到 0x1000000(16M)-0x10000(64K)-0x100000(1M)-0x400000(4M)=0xAF0000

  mkdir -p rootfs
  tar -xvf $YOUR_ROOTFS_FILE -C ./rootfs
  # cp -r $YOUR_MOD_FILE  rootfs/lib/modules/

  # # http://manpages.ubuntu.com/manpages/trusty/man1/mkfs.jffs2.1.html
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0xAF0000 -d rootfs/ -o jffs2.img
  sudo dd if=jffs2.img of=$YOUR_IMG_FILE  bs=1K seek=5184  conv=notrunc

cd ..

sudo sunxi-fel list
sudo sunxi-fel spiflash-info
sudo sunxi-fel -p spiflash-write 0 output/flashimg.bin