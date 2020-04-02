#!/usr/bin/env bash

set -xev

export INSTALL_BUILD_TOOLS=1
export CLEAR_WORKSPACE_BEFORE_BUILD=1
export RENEW_GIT_SOURCE=1
export SEQUENTIAL_BUILD=1
export DOWNLOAD_BUILDROOT=1

cd .docker
  docker build -f ./docker_lichee_builder.yml . -t logickee/licheepi-nano-build
cd ..