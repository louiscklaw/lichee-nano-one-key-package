#!/usr/bin/env bash

set -xe

apt-get update
apt-get install -y tmux sudo git wget curl rsync
apt-get install -y cpio xz-utils

apt-get install -y autoconf automake libtool gettext
apt-get install -y make gcc g++ swig python-dev bc python u-boot-tools bison flex bc libssl-dev libncurses5-dev unzip mtd-utils
apt-get install -y libc6-i386 lib32stdc++6 lib32z1
apt-get install -y libc6 libstdc++6 zlib1g
apt-get install -y linux-headers-$(uname -r)


# apt-get install -y libc6 lib32stdc++6 lib32z1

# for sunxi fel
# apt-get install -y build-essential
# apt-get install -y pkg-config
# apt-get install -y ibusb-1.0-0-dev
# apt-get install -y zlib1g-dev

cd /root/toolchain
  rm -rf gcc*
  wget http://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/arm-linux-gnueabi/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi.tar.xz

  tar -xf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi.tar.xz
cd ../..

export PATH=$PWD/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi/bin:$PATH

exit 0

# done