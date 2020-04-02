#!/usr/bin/env bash

set -xe

#
# make clean
make

cp hello_uart /root/overlay/www/cgi-bin/hello_uart