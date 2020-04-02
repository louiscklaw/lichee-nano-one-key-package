```
# df -kh
Filesystem                Size      Used Available Use% Mounted on
/dev/root                10.0M      9.8M    248.0K  98% /
devtmpfs                 10.6M         0     10.6M   0% /dev
tmpfs                    11.1M         0     11.1M   0% /dev/shm
tmpfs                    11.1M     28.0K     11.0M   0% /tmp
tmpfs                    11.1M     20.0K     11.0M   0% /run
/dev/mtdblock4            1.3M    924.0K    420.0K  69% /overlay
# dmesg
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.2.0-licheepi-nano+ (root@9ae702f33b69) (gcc version 7.5.0 (Linaro GCC 7.5-2019.12)) #4 Sat Mar 28 12:04:24 UTC 2020
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] OF: fdt: Machine model: Lichee Pi Nano
[    0.000000] Memory policy: Data cache writeback
[    0.000000] On node 0 totalpages: 8192
[    0.000000]   Normal zone: 64 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 8192 pages, LIFO batch:0
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8128
[    0.000000] Kernel command line: panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Memory: 21632K/32768K available (7168K kernel code, 246K rwdata, 1600K rodata, 1024K init, 245K bss, 11136K reserved, 0K cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] random: get_random_bytes called from start_kernel+0x254/0x3cc with crng_init=0
[    0.000047] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
[    0.000123] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
[    0.000677] Console: colour dummy device 80x30
[    0.001428] printk: console [tty0] enabled
[    0.001529] Calibrating delay loop... 203.16 BogoMIPS (lpj=1015808)
[    0.070294] pid_max: default: 32768 minimum: 301
[    0.070757] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.070862] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.072552] CPU: Testing write buffer coherency: ok
[    0.074552] Setting up static identity map for 0x80100000 - 0x80100058
[    0.076845] devtmpfs: initialized
[    0.084478] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.084647] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.084994] pinctrl core: initialized pinctrl subsystem
[    0.087434] NET: Registered protocol family 16
[    0.088911] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.091166] cpuidle: using governor menu
[    0.145578] SCSI subsystem initialized
[    0.146048] usbcore: registered new interface driver usbfs
[    0.146265] usbcore: registered new interface driver hub
[    0.146500] usbcore: registered new device driver usb
[    0.147058] pps_core: LinuxPPS API ver. 1 registered
[    0.147142] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.147273] PTP clock support registered
[    0.147814] Advanced Linux Sound Architecture Driver Initialized.
[    0.149492] clocksource: Switched to clocksource timer
[    0.178570] NET: Registered protocol family 2
[    0.180679] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
[    0.180883] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    0.180994] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.181080] TCP: Hash tables configured (established 1024 bind 1024)
[    0.181403] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.181519] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.182160] NET: Registered protocol family 1
[    0.183690] RPC: Registered named UNIX socket transport module.
[    0.183804] RPC: Registered udp transport module.
[    0.183853] RPC: Registered tcp transport module.
[    0.183897] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.185773] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.187909] Initialise system trusted keyrings
[    0.188570] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.210189] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.212785] NFS: Registering the id_resolver key type
[    0.212940] Key type id_resolver registered
[    0.213001] Key type id_legacy registered
[    0.213154] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[    0.220651] Key type asymmetric registered
[    0.220761] Asymmetric key parser 'x509' registered
[    0.220974] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.221066] io scheduler mq-deadline registered
[    0.221116] io scheduler kyber registered
[    0.233077] suniv-f1c100s-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    0.414940] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.420794] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pe not found, using dummy regulator
[    0.442729] 1c25000.serial: ttyS0 at MMIO 0x1c25000 (irq = 25, base_baud = 6250000) is a 16550A
[    0.892984] printk: console [ttyS0] enabled
[    0.898301] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pa not found, using dummy regulator
[    0.930625] 1c25400.serial: ttyS1 at MMIO 0x1c25400 (irq = 26, base_baud = 6250000) is a 16550A
[    0.962240] 1c25800.serial: ttyS2 at MMIO 0x1c25800 (irq = 27, base_baud = 6250000) is a 16550A
[    0.975345] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pd not found, using dummy regulator
[    0.995113] SCSI Media Changer driver v0.25
[    1.001025] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pc not found, using dummy regulator
[    1.014163] m25p80 spi0.0: w25q128 (16384 Kbytes)
[    1.019033] 5 fixed-partitions partitions found on MTD device spi0.0
[    1.025549] Creating 5 MTD partitions on "spi0.0":
[    1.030472] 0x000000000000-0x000000070000 : "u-boot"
[    1.039145] 0x000000070000-0x000000080000 : "dtb"
[    1.047599] 0x000000080000-0x0000004b0000 : "kernel"
[    1.056310] 0x0000004b0000-0x000000eb0000 : "rootfs"
[    1.065037] 0x000000eb0000-0x000001000000 : "overlayfs"
[    1.074560] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.081300] ehci-platform: EHCI generic platform driver
[    1.086923] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.093308] ohci-platform: OHCI generic platform driver
[    1.099036] usbcore: registered new interface driver usb-storage
[    1.107189] input: 1c23400.lradc as /devices/platform/soc/1c23400.lradc/input/input0
[    1.116095] i2c /dev entries driver
[    1.123963] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pf not found, using dummy regulator
[    1.162330] sunxi-mmc 1c0f000.mmc: initialized, max. request size: 16384 KB
[    1.171833] usbcore: registered new interface driver usbhid
[    1.177483] usbhid: USB HID core driver
[    1.198063] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    1.205116] Initializing XFRM netlink socket
[    1.209675] NET: Registered protocol family 17
[    1.214249] NET: Registered protocol family 15
[    1.218905] Key type dns_resolver registered
[    1.225896] Loading compiled-in X.509 certificates
[    1.240766] suniv-f1c100s-pinctrl 1c20800.pinctrl: 1c20800.pinctrl supply vcc-pd not found, using dummy regulator
[    1.252316] sun4i-backend 1e60000.display-backend: Couldn't find matching frontend, frontend features disabled
[    1.263269] sun4i-drm display-engine: bound 1e60000.display-backend (ops 0xc083be14)
[    1.272423] sun4i-drm display-engine: bound 1c0c000.lcd-controller (ops 0xc083aa6c)
[    1.280303] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.286962] [drm] No driver support for vblank timestamp query.
[    1.294448] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine on minor 0
[    1.501467] mmc0: new high speed SDIO card at address 0001
[    1.547191] Console: switching to colour frame buffer device 100x30
[    1.599622] random: fast init done
[    1.636361] sun4i-drm display-engine: fb0: sun4i-drmdrmfb frame buffer device
[    1.658120] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    1.690310] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.711026] vcc5v0: disabling
[    1.727451] ALSA device list:
[    1.743448]   #0: Loopback 1
[    1.760249] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    1.782351] cfg80211: failed to load regulatory.db
[    1.909421] random: crng init done
[    4.231484] VFS: Mounted root (jffs2 filesystem) on device 31:3.
[    4.254715] devtmpfs: mounted
[    4.278196] Freeing unused kernel memory: 1024K
[    4.300951] Run /sbin/init as init process
[   24.257159] r8723bs: module is from the staging directory, the quality is unknown, you have been warned.
[   24.335037] RTL8723BS: module init start
[   24.352938] RTL8723BS: rtl8723bs v4.3.5.5_12290.20140916_BTCOEX20140507-4E40
[   24.373888] RTL8723BS: rtl8723bs BT-Coex version = BTCOEX20140507-4E40
[   24.481563] pnetdev = bfcd3f34
[   24.581036] RTL8723BS: rtw_ndev_init(wlan0)
[   24.607023] RTL8723BS: module init ret =0
[   43.383899] rtl8723bs: acquire FW from file:rtlwifi/rtl8723bs_nic.bin
[   50.793662] RTL8723BS: rtw_set_802_11_connect(wlan0)  fw_state = 0x00000008
[   50.917290] RTL8723BS: start auth
[   50.935840] RTL8723BS: auth success, start assoc
[   51.892415] RTL8723BS: rtw_cfg80211_indicate_connect(wlan0) BSS not found !!
[   51.912093] RTL8723BS: assoc success
[   52.025219] RTL8723BS: send eapol packet
[   52.140436] RTL8723BS: send eapol packet
[   52.158185] RTL8723BS: set pairwise key camid:4, addr:cc:2d:e0:da:9a:26, kid:0, type:AES
[   52.205527] RTL8723BS: set group key camid:5, addr:cc:2d:e0:da:9a:26, kid:1, type:AES
```