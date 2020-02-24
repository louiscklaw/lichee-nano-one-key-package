#!/usr/bin/env bash
apt-get update
apt-get install -y tmux sudo git wget curl

apt-get install -y autoconf automake libtool gettext
apt-get install -y make gcc g++ swig python-dev bc python u-boot-tools bison flex bc libssl-dev libncurses5-dev unzip mtd-utils
apt-get install -y libc6-i386 lib32stdc++6 lib32z1
# apt-get install -y libc6 lib32stdc++6 lib32z1
apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386
apt-get install -y rsync cpio

apt-get install -y mtd-utils
apt-get install -y linux-headers-$(uname -r)


# for sunxi fel
# apt-get install -y build-essential
# apt-get install -y pkg-config
# apt-get install -y ibusb-1.0-0-dev
# apt-get install -y zlib1g-dev