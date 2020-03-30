#!/usr/bin/env sh

set -xe

insmod r8723bs.ko

mkdir -p /lib/firmware/rtlwifi

# cp rtl8723bs_nic.bin /lib/firmware/rtlwifi
rm -rf /lib/firmware/rtlwifi/rtl8723bs_nic.bin
ln -s   /overlay/rtl8723bs_nic.bin /lib/firmware/rtlwifi/rtl8723bs_nic.bin

wpa_supplicant -B -i wlan0 -c /overlay/wpa_home/wpa_supplicant.conf

sleep 10

udhcpc -i wlan0

# assume network started

uhttpd -p 80 -h /overlay/www
./utils/send_slack_httpd_started.sh

/overlay/get_stat.sh > /overlay/stat.txt

./utils/send_slack_module_ready.sh
