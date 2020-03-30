#!/usr/bin/env bash

set -xe

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

#
# make clean
make

cp helloworld ../../output/overlay