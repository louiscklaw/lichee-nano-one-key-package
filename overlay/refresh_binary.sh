#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay
set -xe

safe_sync () {
  sync
  sleep 0.01
}

wgetfile () {
  TMP_PATH=/tmp/$1
  OVERLAY_PATH=/overlay/$1

  echo "wget file: $1"
  echo ""
  wget http://192.168.99.253:8000/$1 -O $TMP_PATH
  safe_sync

  rm -rf $OVERLAY_PATH
  mv $TMP_PATH $OVERLAY_PATH
  safe_sync

  chmod +x $OVERLAY_PATH
  safe_sync

}

updateclient () {
  REACT_ARCHIVE=react_client.zip
  TMP_PATH=/tmp/$REACT_ARCHIVE
  OVERLAY_PATH=/overlay/$REACT_ARCHIVE

  wget http://192.168.99.253:8000/$REACT_ARCHIVE -O $OVERLAY_PATH

  cd /overlay
    unzip -o $OVERLAY_PATH -d /tmp/www
  cd -

  safe_sync
}

updateinitd () {
  TARGET_FILE=$1
  TMP_PATH=/tmp/$TARGET_FILE
  OVERLAY_PATH=/overlay/$TARGET_FILE
  INIT_PATH=/etc/init.d/$TARGET_FILE

  wget http://192.168.99.253:8000/init.d/$1 -O $TMP_PATH
  chmod +x $TMP_PATH

  mv $TMP_PATH $INIT_PATH

  safe_sync
}

cd /overlay
  wgetfile refresh_binary.sh
  wgetfile refresh_binary_content.sh
  # wget http://192.168.99.253:8000/refresh_binary.sh -O /tmp/refresh_binary.sh

  mkdir -p /overlay/www/cgi-bin
  mkdir -p /tmp/www/cgi-bin
  wgetfile www/cgi-bin/refresh.sh
  # wget http://192.168.99.253:8000/www/cgi-bin/refresh.sh -O /tmp/www/cgi-bin/refresh.sh

cd ..

safe_sync

/overlay/refresh_binary_content.sh

safe_sync

echo "done"