#!/usr/bin/env bash

# https://www.panix.com/~elflord/unix/bash-tute.html

if [ -z "$CI" ]
then
  # local build
  echo "skipping install tools"

  set -xe
else
  # # build on travis
  # echo "setup INSTALL_BUILD_TOOLS"
  export INSTALL_BUILD_TOOLS=1

  # echo "setup CLEAR_WORKSPACE_BEFORE_BUILD"
  export CLEAR_WORKSPACE_BEFORE_BUILD=1

  # echo "setup RENEW_GIT_SOURCE"
  export RENEW_GIT_SOURCE=1

  # echo "setup SEQUENTIAL_BUILD"
  # export SEQUENTIAL_BUILD=1

  # echo "setup DOWNLOAD_BUILDROOT "
  export DOWNLOAD_BUILDROOT=1

  set -e
fi

if [ -z "$DOCKER_ENVIRONEMNT" ]
then
  echo "ERROR: should be launch inside docker "
  exit 1
else
  echo "checked docker environment, continue"
fi

cd /root
  cd scripts
    if [ -z "$INSTALL_BUILD_TOOLS" ]
    then
      echo "skipping install tools"
    else
      ./init.sh | tee init.log
    fi

    if [ -n "$SEQUENTIAL_BUILD" ]
    then
      echo "start sequential build"
      ./build_zImage.sh | tee build_zImage.log
      ./build_dts.sh | tee build_dts.log
      ./build_uboot.sh  | tee build_uboot.log
      ./build_rootfs.sh | tee build_rootfs.log
    else
      echo "start parallel build"
      ./build_zImage.sh | tee build_zImage.log &
      ./build_dts.sh | tee build_dts.log &
      ./build_uboot.sh  | tee build_uboot.log &
      ./build_rootfs.sh | tee build_rootfs.log &
      wait
    fi

  cd ..
cd ..

echo "build all done"

# done