#!/usr/bin/env sh

set -xe

cd src/powersupply-pi-client
  # PUBLIC_URL=https://louiscklaw.github.io/test-react-pwa yarn build
  yarn build
cd -

cd src/powersupply-pi-client/build
  zip -r /home/logic/_workspace/lichee-nano-one-key-package/overlay/react_client.zip ./

cd -
