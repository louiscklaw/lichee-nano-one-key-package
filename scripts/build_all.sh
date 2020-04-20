#!/usr/bin/env bash

# https://www.panix.com/~elflord/unix/bash-tute.html

set -e

# export CLEAR_WORKSPACE_BEFORE_BUILD=1

sudo rm -rf /root/rootfs_ws/buildroot-2019.11.1/output/build/busybox-1.31.1/.stamp_built

if [ -z "$CI" ]
then
  # local build
  echo "skipping install tools"

else
  # setup INSTALL_BUILD_TOOLS
  export INSTALL_BUILD_TOOLS=1

  # setup CLEAR_WORKSPACE_BEFORE_BUILD
  export CLEAR_WORKSPACE_BEFORE_BUILD=1

  # setup RENEW_GIT_SOURCE
  export RENEW_GIT_SOURCE=1

  # echo "setup SEQUENTIAL_BUILD"
  export SEQUENTIAL_BUILD=1

  # echo "setup DOWNLOAD_BUILDROOT "
  export DOWNLOAD_BUILDROOT=1

  set -e
fi

if [ -z "$DOCKER_ENVIRONEMNT" ]
then
  echo "should run inside docker"
  exit 99
else
  echo "checked docker environment, continue"
fi

cd /root/scripts

    # if [ -z "$INSTALL_BUILD_TOOLS" ]
    # then
    #   echo "skipping install tools"
    # else
    #   ./init.sh | tee init.log
    # fi

    if [ -n "$SEQUENTIAL_BUILD" ]
    then
      echo "start sequential build"
      # ./build_zImage.sh | tee build_zImage.log
      ./build_dts.sh | tee build_dts.log
      # ./build_uboot.sh  | tee build_uboot.log
      # ./build_rootfs.sh | tee build_rootfs.log
    else
      echo "start parallel build"
      ./build_zImage.sh | tee build_zImage.log &
      ./build_dts.sh | tee build_dts.log &
      ./build_uboot.sh  | tee build_uboot.log &
      ./build_rootfs.sh | tee build_rootfs.log &
      wait
    fi

cd -

# build all done
generate_post_data()
{
  HOSTNAME=`hostname`
cat <<EOF
  {"text":"$HOSTNAME lichee-nano-one-key-package build all done"}
EOF
}

data='{"text":"${page} lichee-nano-one-key-package build all done"}'
curl -X POST -H 'Content-type: application/json' --data "$(generate_post_data)" $SLACK_DEBUG_WEBHOOK

# done