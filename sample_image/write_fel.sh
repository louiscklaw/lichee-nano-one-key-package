#!/usr/bin/env bash
# http://nano.lichee.pro/index.html

# panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2
# sf probe 0 50000000; sf read 0x80c00000 0x0100000 0x10000; sf read 0x80008000 0x0110000 0x400000; bootz 0x80008000 - 0x80c00000
# # sf probe 0;sf erase 0 0x100000;reset
# #

sudo sunxi-fel list
sudo sunxi-fel spiflash-info

sudo sunxi-fel -v -p spiflash-write 0 Nano_flash_800480.bin