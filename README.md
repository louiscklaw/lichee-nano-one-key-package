# README.md

### travis build site
https://travis-ci.com/louiscklaw/lichee-nano-one-key-package

https://api.travis-ci.org/v3/job/6073028/log.txt

### references:
esp8089_ws/esp8089_licheepi => https://github.com/Lichee-Pi/esp8089.git

```
pwd
/home/logic/_del/lichee-nano-one-key-package

docker run -it -v $PWD:/root ubuntu bash
cd /root
./init.sh
```

### NOTES:
<!-- ```
~/Downloads via ⬢ v12.16.1
docker import licheepi-nano-docker-v1_0.tar
sha256:bf31d3f16063cb99ecc9417853889bb6b44aa997d035a222efdb3c792141c351
``` -->

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


`insmod /lib/modules/4.15.0-rc8-licheepi-nano\+/kernel/drivers/net/wireless/esp8089-nano-4.15/esp8089.ko`

`insmod /lib/modules/5.2.0-licheepi-nano\+/kernel/drivers/net/wireless/esp8089_driver/esp8089.ko`
`modprobe esp8089 config=crystal_26M_en=2`

### getting wifi to work

总结一下以前帖子里填过的坑，因为最近想用一下wifi，发现忘记怎么设置了。
之前帖子链接 https://whycan.cn/t_2091.html 。

这里我只记录连接路由的设置步骤：
1.配置/etc/wpa_supplicant.conf

```
ctrl_interface=/var/run/wpa_supplicant
<!-- ctrl_interface_group=wheel -->
update_config=1
ap_scan=1

network={
        ssid="logicdebug"
        #psk="1233211234567"
        psk=6f4cf9c657d6d4a5a65bc0f86a70611e01129cc799bc26308c3e826693763bba
}
```

2.执行wpa_supplicant -i wlan0 -D wext -c /etc/wpa_supplicant.conf -B
`wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf`
`wpa_supplicant -i wlan0 -D wext -c /etc/wpa_supplicant.conf -B`

ifconfig wlan0 192.168.99.100 netmask 255.255.255.0 up
route add default gw 192.168.99.1

3.udhcpc -i wlan0
