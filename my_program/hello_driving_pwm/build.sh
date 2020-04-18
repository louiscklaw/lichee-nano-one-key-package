#!/usr/bin/env bash

set -xe

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

#
# make clean
make

cp hello_driving_pwm /root/overlay/www/cgi-bin/hello_driving_pwm
cp test_pwm.sh /root/overlay/www/cgi-bin/test_pwm.sh