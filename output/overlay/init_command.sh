#!/usr/bin/sh

set -xe

cd /
mkdir -p /overlay
mount -t jffs2 /dev/mtdblock4 /overlay