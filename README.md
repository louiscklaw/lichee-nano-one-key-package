# README.md

```
pwd
/home/logic/_del/lichee-nano-one-key-package

docker run -it -v $PWD:/root ubuntu bash
cd /root
./init.sh
```

```
cd /root
./build.sh pull_all
./build. nano_spiflash
```

### NOTES:
```
~/Downloads via ⬢ v12.16.1
docker import licheepi-nano-docker-v1_0.tar
sha256:bf31d3f16063cb99ecc9417853889bb6b44aa997d035a222efdb3c792141c351
```

### CURRENT OUTSTANDING
```
E: Package 'libc6:i386' has no installation candidate
E: Unable to locate package libstdc++6:i386
E: Couldn't find any package by regex 'libstdc++6'
E: Unable to locate package zlib1g:i386
```

https://linux-sunxi.org/Bootable_SPI_flash
### wipe SPI
disconnect all cable(all powers)
connect CH340 to F1c100s
prepare minicom
connect Ch340 usb cable
look minicom, the boot message prompts
boot to bootstrap (press a key when countdown)

sunxi-fel erase spi command

`sf probe 0;sf erase 0 0x100000;reset`

MISSING dmesg message

```
sunxi-fel list
USB device 003:025   Allwinner F1C100s
```

```
./sunxi-fel spiflash-info
```

example:
```
sudo sunxi-fel spiflash-info
Warning: no 'soc_sram_info' data for your SoC (id=1663)
SPI support not implemented yet for 0 ((null))!
```

```
sunxi-fel -p spiflash-write 0 output/spiflash-bin/lichee-nano-normal-size.bin
```

```
sunxi-fel -p spiflash-write 0 output/flashimg.bin
```

done

### config files location
uboot
zImage
rootfs


### ref
https://whycan.cn/t_2002.html#p13479


### key files
linux/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts