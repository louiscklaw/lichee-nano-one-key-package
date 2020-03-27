#!/usr/bin/env bash

set -xev

make clean
make

cp hello_ping ../../output/overlay