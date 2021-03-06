#!/usr/bin/env bash

# panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2
# sf probe 0 50000000; sf read 0x80c00000 0x0100000 0x10000; sf read 0x80008000 0x0110000 0x400000; bootz 0x80008000 - 0x80c00000
# # sf probe 0;sf erase 0 0x100000;reset
# #
set -xe

sudo sunxi-fel list
sudo sunxi-fel spiflash-info

# packing new powersupply-pi binary to the overlay directory
  # copy new powersupply-pi to overlay directory
  cp /home/logic/_workspace/lichee-nano-one-key-package/my_program/hello_dps_on/hello_uart /home/logic/_workspace/lichee-nano-one-key-package/overlay/www/cgi-bin/dps_on



  # prepare overlay_fs
  sudo rm -rf ./output/overlay
  cp -r ./overlay ./output
  # ls -l ./output/overlay
  sudo chmod -R +x  ./output *.sh


  # usage of overlay
  du -sh ./output/overlay

# add entry into startup script
  # link into startup script

  sudo cp /home/logic/_workspace/lichee-nano-one-key-package/overlay/init.d/S* /home/logic/_workspace/lichee-nano-one-key-package/output/rootfs/etc/init.d/


  sudo chmod +x /home/logic/_workspace/lichee-nano-one-key-package/output/rootfs/etc/init.d/S*


# add ssh-key to the module
cd output
  sudo mkdir -p ./overlay/.ssh

  sudo cp -r /home/logic/_workspace/lichee-nano-one-key-package/ssh-keystore/* ./overlay/.ssh/

cd ..

# add rtl8723 drivers
cd output
  sudo cp -r /home/logic/_workspace/lichee-nano-one-key-package/linux_ws/linux_5_2/drivers/staging/rtl8723bs/r8723bs.ko ./overlay/r8723bs.ko

  sudo cp -r /home/logic/_workspace/lichee-nano-one-key-package/rtl8723bs_ws/rtl8723bs_nic.bin ./overlay/rtl8723bs_nic.bin

cd ..

# prepare rootfs...
cd output
  # clear workspace

  echo "regenerate rootfs.img"
  rm -rf rootfs.img
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0xA00000 -d ./rootfs/ -o rootfs.img

  echo "regenerate overlay.img"
  rm -rf overlay.img
  sudo mkfs.jffs2 -s 0x100 -e 0x10000 --pad=0x150000 -d ./overlay/ -o overlay.img

cd ..

# list size of files
ls -l output/u-boot-sunxi-with-spl.bin
ls -l output/suniv-f1c100s-licheepi-nano.dtb
ls -l output/rootfs.img
ls -l output/zImage

md5sum output/u-boot-sunxi-with-spl.bin
md5sum output/suniv-f1c100s-licheepi-nano.dtb
md5sum output/rootfs.img
md5sum output/zImage

sudo du -sh output/rootfs


# download to module
  # uboot
  sudo sunxi-fel -v  -p spiflash-write 0 output/u-boot-sunxi-with-spl.bin

  # dtb
  # NOTE: edit this files only, not for download
  # /home/logic/_workspace/lichee-nano-one-key-package/linux_ws/dts_file/suniv-f1c100s-licheepi-nano.dts
  sudo sunxi-fel -v -p spiflash-write 0x70000 output/suniv-f1c100s-licheepi-nano.dtb

  # TODO: resume me
  # kernel
  ls -lh output/zImage
  sudo sunxi-fel -v -p spiflash-write 0x80000 output/zImage

  # TODO: resume me
  sudo sunxi-fel -v -p spiflash-write 0x4B0000 output/rootfs.img

  # TODO: resume me
  sudo sunxi-fel -v -p spiflash-write 0xEB0000 output/overlay.img


# uboot erase and reset
# sf probe 0;sf erase 0 0x100000;reset
