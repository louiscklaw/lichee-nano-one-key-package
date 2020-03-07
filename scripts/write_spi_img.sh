#!/usr/bin/env bash

# setenv bootargs console=tty0 console=ttyS0,115200 panic=5 rootwait root=/dev/mmcblk0p2 rw
# load mmc 0:1 0x80C00000 suniv-f1c100s-licheepi-nano-with-lcd.dtb
# load mmc 0:1 0x80008000 zImage
# bootz 0x80008000 - 0x80C00000

# sf probe 0;sf erase 0 0x100000;reset

set -x

YOUR_ROOTFS_FILE=rootfs.tar
YOUR_IMG_FILE=/home/logic/_del/lichee-nano-one-key-package/sample_image/rtl8723_wifi.bin

cd output
  sudo rm -rf $YOUR_IMG_FILE
  ls -lh $YOUR_IMG_FILE

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

  # copy modules rtl8723
  # sudo cp -r /home/logic/_del/lichee-nano-one-key-package/linux_ws/linux_5_2/drivers/staging/rtl8723bs/r8723bs.ko rootfs/root/r8723bs.ko

  # # http://manpages.ubuntu.com/manpages/trusty/man1/mkfs.jffs2.1.html
  # [ -s,--pagesize=SIZE ] [ -e,--eraseblock=SIZE ]
  # http://wiki.emacinc.com/wiki/Mounting_JFFS2_Images_on_a_Linux_PC
  # sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0xAF0000 -d ./rootfs/ -o jffs2.img
  # 0x100 0000 - 0x61 0000 = 0x9F0000
  sudo rm -rf jffs2.img
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x9F0000 -d ./rootfs/ -o jffs2.img

  # 0x610000 => 6356992(10)/1024 => 6208
  sudo dd if=jffs2.img of=$YOUR_IMG_FILE  bs=1K seek=6208  conv=notrunc
  md5sum $YOUR_IMG_FILE

  ls -lh $YOUR_IMG_FILE

  # md5sum *
cd ..

sudo sunxi-fel list
sudo sunxi-fel spiflash-info
# sudo sunxi-fel -p spiflash-write 0 output/flashimg.bin
sudo sunxi-fel -p spiflash-write 0 /home/logic/_del/lichee-nano-one-key-package/sample_image/rtl8723_wifi.bin
