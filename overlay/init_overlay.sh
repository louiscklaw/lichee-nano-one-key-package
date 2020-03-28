#!/usr/bin/sh

# suppose running on /root

set -xe

cd /
mkdir -p /overlay
mount -t jffs2 /dev/mtdblock4 /overlay


cd /overlay
  sh init_main.sh
cd ..