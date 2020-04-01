#!/usr/bin/env sh

set -xe

insmod r8723bs.ko

mkdir -p /lib/firmware/rtlwifi

# cp rtl8723bs_nic.bin /lib/firmware/rtlwifi
rm -rf /lib/firmware/rtlwifi/rtl8723bs_nic.bin
ln -s   /overlay/rtl8723bs_nic.bin /lib/firmware/rtlwifi/rtl8723bs_nic.bin

mv /etc/wpa_supplicant.conf /etc/wpa_supplicant.conf.buildroot
ln -s /overlay/wpa_home/wpa_supplicant.conf /etc/wpa_supplicant.conf
# ln -s /overlay/wpa_home/wpa_supplicant_ap.conf /etc/wpa_supplicant_ap.conf

wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf

sleep 10

udhcpc -i wlan0

# assume network started after this line

# wget

# extract http client content
# /tmp/powersupply-pi-client
unzip -o /overlay/react_client.zip -d /tmp

# init http server
# uhttpd -p 80 -h /overlay/www
uhttpd -p 80 -h /tmp/powersupply-pi-client/build
./utils/send_slack_httpd_started.sh

/overlay/get_stat.sh > /overlay/stat.txt

# send done message
./utils/send_slack_module_ready.sh
