#!/usr/bin/env bash

set -xe

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

rm -rf set_voltage

make

cp set_voltage /root/overlay/www/cgi-bin
chown 1000:1000 /root/overlay/www/cgi-bin/set_voltage
chmod +x /root/overlay/www/cgi-bin/set_voltage
