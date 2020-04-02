# README.md

### build log
- enable busybox-timeout
- enable dropbear
- enable uhttpd
- enable wget(https)

### build status
| master                                                                                                                                                          | develop                                                                                                                                                          |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [![Build Status](https://travis-ci.com/louiscklaw/lichee-nano-one-key-package.svg?branch=master)](https://travis-ci.com/louiscklaw/lichee-nano-one-key-package) | [![Build Status](https://travis-ci.com/louiscklaw/lichee-nano-one-key-package.svg?branch=develop)](https://travis-ci.com/louiscklaw/lichee-nano-one-key-package) |
|                                                                                                                                                                 |                                                                                                                                                                  |
|                                                                                                                                                                 |                                                                                                                                                                  |

### build process
- get docker image
- build inside docker
- fel to FC100s

```
https://tools.ietf.org/html/rfc3875
```

```
find overlay |entr -c -s "cp -r overlay ./output/overlay"
```

### test command
```
➜ curl http://192.168.99.250/cgi-bin/hello_uart
<h1>Bad Gateway</h1>The process did not produce any response%

➜ curl http://192.168.99.250/cgi-bin/hello_uart_off
<h1>Bad Gateway</h1>The process did not produce any response%

```

### to run docker
```
$ docker run -it -v $PWD:/root logickee/licheepi-nano-build bash

// inside docker
$ ./init.sh
```

### to build docker image `build_docker_image.sh`
```
$ cd .docker
$ docker build -f ./docker_lichee_builder.yml . -t logickee/licheepi-nano-build

```

### to compile user program
- ensure the rootfs were compiled and run-able
- it requires a workable musl compiler from rootfs/host directory
```
$ cd my_program
$ ./build_all.sh
```

Busybox的设置
有一些软件包在busybox内是自带的，可以到使用busybox的menuconfig进行配置。需要先运行一次make生成busybox的构建文件夹，然后再使用 make busybox-menuconfig 配置。每次clean后都需要重新配置一次，因为在clean的时候这个配置会被清除。

```
dts file:

/home/logic/_workspace/lichee-nano-one-key-package/linux_ws/dts_file/suniv-f1c100s-licheepi-nano.dts


/home/logic/_workspace/lichee-nano-one-key-package/linux_ws/linux_5_2/arch/arm/boot/dts/suniv-f1c100s.dtsi
/home/logic/_workspace/lichee-nano-one-key-package/linux_ws/linux_5_2/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts



```

```
my_program
my_program/helloworld
```


```
command to test serial port

cat /dev/ttyS1 & cat > /dev/ttyS1
cat /dev/ttyS2 & cat > /dev/ttyS2
```

```
cd /root
./build.sh pull_all
./build. nano_spiflash
```

```
make ARCH=arm menuconfig
```

### NOTES:
```
~/Downloads via ⬢ v12.16.1
➜ docker import licheepi-nano-docker-v1_0.tar
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

MISSING sunxi-fel erase spi command

MISSING dmesg message

```
➜ sunxi-fel list
USB device 003:025   Allwinner F1C100s
```

```
./sunxi-fel spiflash-info
```

```
~ via ⬢ v12.16.1
➜ sunxi-fel -p spiflash-write 0 /home/logic/_del/lichee-nano-one-key-package/output/spiflash-bin/lichee-nano-normal-size.bin
```

done



### flash log
```
ls: cannot access 'flashimg.bin': No such file or directory
16+0 records in
16+0 records out
16777216 bytes (17 MB, 16 MiB) copied, 0.00937611 s, 1.8 GB/s
984+0 records in
984+0 records out
1007616 bytes (1.0 MB, 984 KiB) copied, 0.00278339 s, 362 MB/s
8+1 records in
8+1 records out
9134 bytes (9.1 kB, 8.9 KiB) copied, 9.1083e-05 s, 100 MB/s
4273+1 records in
4273+1 records out
4375744 bytes (4.4 MB, 4.2 MiB) copied, 0.0132219 s, 331 MB/s
cc6a0a357bd08731bcdbc1072d6c0f4b  flashimg.bin
4160+0 records in
4160+0 records out
4259840 bytes (4.3 MB, 4.1 MiB) copied, 0.0150049 s, 284 MB/s
68cfdc5677ca7e90c546b8a6c813be11  flashimg.bin
-rw-r--r-- 1 root root 16M Mar  7 17:13 flashimg.bin
USB device 003:090   Allwinner F1C100s
Manufacturer: Winbond (EFh), model: 40h, size: 16777216 bytes.
100% [================================================] 16777 kB,   95.2 kB/s
```