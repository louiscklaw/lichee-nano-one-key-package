#!/usr/bin/env bash

set -xe

if [ -z "$DOCKER_ENVIRONEMNT" ]
then
  echo "ERROR: should be launch inside docker "
  exit 1
else
  echo "checked docker environment, continue"
fi

cd /root
  cd my_program
    ./build_all.sh
  cd ..
cd ..

echo "powersupply-pi done"