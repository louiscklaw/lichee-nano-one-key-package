#!/usr/bin/env bash

set -xev

export INSTALL_BUILD_TOOLS=1
export CLEAR_WORKSPACE_BEFORE_BUILD=1
export RENEW_GIT_SOURCE=1
export SEQUENTIAL_BUILD=1
export DOWNLOAD_BUILDROOT=1

if [ -n "$DOCKER_ENVIRONEMNT" ]; then
  echo "checked docker environment, continue"
else
  echo "ERROR: should be launch inside docker "
  exit 1
fi

cd /root
  cd scripts
    if [ -n "$INSTALL_BUILD_TOOLS" ]; then
      echo "install build tools"
      ./init.sh
    else
      echo "no need to install build tools"
    fi
  cd ..
cd ..

cd /root
  cd uboot_ws
    ./build_uboot_spi.sh
  cd ..
cd ..

echo "uboot done"