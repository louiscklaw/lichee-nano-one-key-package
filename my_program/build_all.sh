#!/usr/bin/env bash

set -xe

export PATH=/root/rootfs_ws/buildroot-2019.11.1/output/host/bin:$PATH

cd my_program

  cd helloworld
    ./build.sh
  cd ..

  cd hello_gpio
    ./build.sh
  cd ..

  cd set_voltage
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

  cd hello_1k_pwm
    ./build.sh
  cd ..

  cd hello_driving_pwm
    ./build.sh
  cd ..

cd ..
exit 0