#!/usr/bin/env sh

cd .docker
  docker build -f ./docker_lichee_builder.yml . -t logickee/licheepi-nano-build
cd -