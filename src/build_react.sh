#!/usr/bin/env sh

set -xe

cd src/powersupply-pi-client
  yarn build
cd ../..

rm -rf src/react_client.zip


pwd

cd src
  zip -r react_client.zip powersupply-pi-client/build
cd ..

ls -lh src/react_client.zip

mv src/react_client.zip overlay/react_client.zip