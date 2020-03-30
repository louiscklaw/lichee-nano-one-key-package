#!/usr/bin/env bash

# https://www.panix.com/~elflord/unix/bash-tute.html

set -xev

# export CLEAR_WORKSPACE_BEFORE_BUILD=1

sudo rm -rf /root/rootfs_ws/buildroot-2019.11.1/output/build/busybox-1.31.1/.stamp_built

if [ -z "$CI" ]
then
  echo "skipping install tools"
else
  echo "setup INSTALL_BUILD_TOOLS"
  export INSTALL_BUILD_TOOLS=1

  echo "setup CLEAR_WORKSPACE_BEFORE_BUILD"
  export CLEAR_WORKSPACE_BEFORE_BUILD=1

  echo "setup RENEW_GIT_SOURCE"
  export RENEW_GIT_SOURCE=1
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

    ./build_dts.sh | tee build_dts.log &
    ./build_zImage.sh | tee build_zImage.log &
    ./build_rootfs.sh | tee build_rootfs.log &
    ./build_uboot.sh  | tee build_uboot.log &

    wait


  cd ..


cd ..

echo "build all done"

curl -X POST -H 'Content-type: application/json' --data '{"text":"/home/logic/_workspace/lichee-nano-one-key-package build all done!"}' 'https://hooks.slack.com/services/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'

# done