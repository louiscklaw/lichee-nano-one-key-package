#!/usr/bin/env bash

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

set -xev

cd helloworld
  ./build.sh
cd ..


cd hello_ping
  ./build.sh
cd ..

cd hello_dps_on
  ./build.sh
cd ..

cd hello_dps_off
  ./build.sh
cd ..


exit 0