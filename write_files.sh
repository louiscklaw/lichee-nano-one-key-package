#!/usr/bin/env bash

sudo mkfs.vfat /dev/sdb1
sudo mkfs.ext2 /dev/sdb2

sudo mount /dev/sdb1 /mnt/1
sudo mount /dev/sdb2 /mnt/2

sudo cp output/boot.scr /mnt/1
sudo cp output/zImage /mnt/1
sudo cp output/suniv-f1c100s-licheepi-nano.dtb /mnt/1
sync

sudo cp output/rootfs.tar /mnt/2

cd /mnt/2
  sudo tar -xf rootfs.tar
cd ..

cd /home/logic/_del/lichee-nano-one-key-package
sync
sudo rm /mnt/2/rootfs.tar
sync
sudo umount /dev/sdb{1,2}
