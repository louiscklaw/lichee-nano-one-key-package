#!/usr/bin/env bash

set -xev

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

#
# make clean
rm -rf set_voltage

make

cp helloworld ../../output/overlay