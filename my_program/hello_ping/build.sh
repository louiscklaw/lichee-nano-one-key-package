#!/usr/bin/env bash

set -xe

# make clean
make

cp hello_ping /root/overlay/www/cgi-bin/hello_ping