#!/usr/bin/env bash

# panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2
# sf probe 0 50000000; sf read 0x80c00000 0x0100000 0x10000; sf read 0x80008000 0x0110000 0x400000; bootz 0x80008000 - 0x80c00000
# # sf probe 0;sf erase 0 0x100000;reset
# #
set -xe

sudo sunxi-fel list
sudo sunxi-fel spiflash-info


# # # rootfs
printf "\nprepare rootfs... \n"
cd output
  sudo cp -r /home/logic/_del/lichee-nano-one-key-package/linux_ws/linux_5_2/drivers/staging/rtl8723bs/r8723bs.ko ./rootfs/root/r8723bs.ko

  # in module : mkdir -p /lib/firmware/rtlwifi
  # in module : cp rtl8723bs_nic.bin /lib/firmware/rtlwifi/
  sudo mkdir -p ./rootfs/lib/firmware/rtlwifi
  sudo cp -r /home/logic/_del/lichee-nano-one-key-package/rtl8723bs_ws/rtl8723bs_nic.bin ./rootfs/lib/firmware/rtlwifi/rtl8723bs_nic.bin

  sudo cp -r /home/logic/_del/lichee-nano-one-key-package/root_home/wpa_supplicant.conf ./rootfs/root/wpa_supplicant.conf

  # sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x500000 -d ./rootfs/ -o jffs2.img
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x9F0000 -d ./rootfs/ -o jffs2.img
cd ..

printf "\nprepare complete... \n"


printf "\nsize of files\n"
ls -lh output/u-boot-sunxi-with-spl.bin
ls -lh output/suniv-f1c100s-licheepi-nano.dtb
ls -lh output/jffs2.img
ls -lh output/zImage

sudo du -sh output/rootfs


# # # uboot
sudo sunxi-fel -v  -p spiflash-write 0 output/u-boot-sunxi-with-spl.bin

# # # dtb
sudo sunxi-fel -v -p spiflash-write 0x0100000 output/suniv-f1c100s-licheepi-nano.dtb

# # # kernel
sudo sunxi-fel -v -p spiflash-write 0x0110000 output/zImage

sudo sunxi-fel -v -p spiflash-write 0x0610000 output/jffs2.img
# # # jffs2
# # sudo sunxi-fel -v -p spiflash-write 0x960000 jffs2.img


# sf probe 0 50000000
# sf read 0x80C00000 0x100000 0x10000
# sf read 0x80008000 0x110000 0x400000
# bootz 0x80008000 - 0x80C00000

# sf probe 0;sf erase 0 0x100000;reset

# 11bd6a541eef7e01899673800859b2e5  flashimg.bin
# 9c86d862e41797c5a2bca40b71fae0d2  jffs2.img
# 5e6c700fd19476f083dbe90d65a090c8  rootfs.tar
# 5fcf46f0f1192b2bca9efad439b66190  suniv-f1c100s-licheepi-nano.dtb
# 5ae703207bd3b874a36f0cd9884f74bc  u-boot-sunxi-with-spl.bin
# 4171071f3299e637386f5d99399b4def  zImage


# 793bad99f99f7aafa9e98964ab27dcb2  flashimg.bin
# 9c86d862e41797c5a2bca40b71fae0d2  jffs2.img
# md5sum: rootfs: Is a directory
# 5e6c700fd19476f083dbe90d65a090c8  rootfs.tar
# 5fcf46f0f1192b2bca9efad439b66190  suniv-f1c100s-licheepi-nano.dtb
# dd9e89290d8fe6e311e4c6821c3055aa  u-boot-sunxi-with-spl.bin
# c23f24b39c874c4673815d76f0b8ef56  zImage
