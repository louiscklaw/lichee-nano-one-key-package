#!/usr/bin/env bash

# setenv bootargs console=tty0 console=ttyS0,115200 panic=5 rootwait root=/dev/mmcblk0p2 rw
# load mmc 0:1 0x80C00000 suniv-f1c100s-licheepi-nano-with-lcd.dtb
# load mmc 0:1 0x80008000 zImage
# bootz 0x80008000 - 0x80C00000


YOUR_ROOTFS_FILE=rootfs.tar
YOUR_IMG_FILE=flashimg.bin

cd output
  sudo rm -rf $YOUR_IMG_FILE
  ls -lh $YOUR_IMG_FILE
  sudo rm -rf ./rootfs

  sudo dd if=/dev/zero of=$YOUR_IMG_FILE bs=1M count=16

  # partition 0 (u-boot)
  sudo dd if=u-boot-sunxi-with-spl.bin of=$YOUR_IMG_FILE bs=1K conv=notrunc

  # partition 1 (dtb)
  # offset from beginning 1M (bs=1K seek=1024),
  sudo dd if=suniv-f1c100s-licheepi-nano.dtb of=$YOUR_IMG_FILE bs=1K seek=1024  conv=notrunc

  # partition 2 (zImage)
  # offset from beginning 1M+64k (bs=1K seek=1088)
  sudo dd if=zImage of=$YOUR_IMG_FILE bs=1K seek=1088  conv=notrunc
  md5sum $YOUR_IMG_FILE

  # partition 3
  # # 为根文件系统制作jffs2镜像包
  # # --pad参数指定 jffs2大小
  # # 由此计算得到 0x1000000(16M)-0x10000(64K)-0x100000(1M)-0x400000(4M)=0xAF0000

  sudo rm -rf ./rootfs
  sudo rm -rf ./jffs2.img

  mkdir -p rootfs
  sudo tar xf $YOUR_ROOTFS_FILE -C ./rootfs
  # cp -r $YOUR_MOD_FILE  rootfs/lib/modules/

  # # http://manpages.ubuntu.com/manpages/trusty/man1/mkfs.jffs2.1.html
  # [ -s,--pagesize=SIZE ] [ -e,--eraseblock=SIZE ]
  # http://wiki.emacinc.com/wiki/Mounting_JFFS2_Images_on_a_Linux_PC
  # sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0xAF0000 -d ./rootfs/ -o jffs2.img
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x300000 -d ./rootfs/ -o jffs2.img
  sudo dd if=jffs2.img of=$YOUR_IMG_FILE  bs=1K seek=5184  conv=notrunc
  md5sum $YOUR_IMG_FILE

  ls -lh $YOUR_IMG_FILE

  md5sum *
cd ..

sudo sunxi-fel list
sudo sunxi-fel spiflash-info
sudo sunxi-fel -p spiflash-write 0 output/flashimg.bin
