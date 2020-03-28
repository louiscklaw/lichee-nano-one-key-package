#!/usr/bin/env sh

set -xev

insmod r8723bs.ko

mkdir -p /lib/firmware/rtlwifi

cp rtl8723bs_nic.bin /lib/firmware/rtlwifi
# ln -s   rtl8723bs_nic.bin /lib/firmware/rtlwifi/rtl8723bs_nic.bin

wpa_supplicant -B -i wlan0 -c /overlay/wpa_supplicant.conf

sleep 10

udhcpc -i wlan0

uhttpd -p 80 -h /overlay/www

/overlay/get_stat.sh > /overlay/stat.txt