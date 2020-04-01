#!/usr/bin/env sh

set -xe

cd src/powersupply-pi-client
  PUBLIC_URL=https://louiscklaw.github.io/test-react-pwa yarn build
cd ../..

pwd

rm -rf /home/logic/_workspace/test-react-pwa/docs

cd src/powersupply-pi-client
  cp -R build/ /home/logic/_workspace/test-react-pwa/docs

cd ../../..