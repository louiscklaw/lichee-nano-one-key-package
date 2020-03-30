#!/usr/bin/env bash

set -xe

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

#
# make clean
rm -rf set_voltage

make

cp set_voltage ../../output/overlay