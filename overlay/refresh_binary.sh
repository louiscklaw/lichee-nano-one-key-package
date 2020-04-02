#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay
set -xe

wgetfile () {
  TMP_PATH=/tmp/$1
  OVERLAY_PATH=/overlay/$1

  echo "wget file: $1"
  echo ""
  wget http://192.168.99.253:8000/$1 -O $TMP_PATH
  rm -rf $OVERLAY_PATH
  mv $TMP_PATH $OVERLAY_PATH
  sleep 0.1
  chmod +x $OVERLAY_PATH
}

cd /overlay
  wgetfile refresh_binary.sh
  # wget http://192.168.99.253:8000/refresh_binary.sh -O /tmp/refresh_binary.sh

  wgetfile www/cgi-bin/refresh.sh
  # wget http://192.168.99.253:8000/www/cgi-bin/refresh.sh -O /tmp/www/cgi-bin/refresh.sh

cd ..

sleep 3

cd /overlay/www
  # index.html
  wgetfile www/index.html

cd ../..

cd /overlay/www/cgi-bin
  # hello_json.sh
  wgetfile www/cgi-bin/hello_json.sh

  wgetfile www/cgi-bin/set_voltage
  wgetfile www/cgi-bin/change_settings.sh
  wgetfile www/cgi-bin/hello_uart_off


cd ../../..

cd /overlay
  mkdir -p /tmp/utils
  mkdir -p /overlay/utils

  wgetfile utils/send_slack.sh
  # wget http://192.168.99.253:8000/utils/send_slack.sh


  wgetfile utils/send_slack.sh
  wgetfile utils/send_slack_module_ready.sh
  wgetfile utils/send_slack_job_done.sh
  wgetfile utils/send_slack_httpd_started.sh
  wgetfile utils/send_slack_helloworld.sh
  wgetfile utils/send_slack_module_ready.sh

  wgetfile init_main.sh

cd ..

cd /etc
  wget http://192.168.99.253:8000/init.d/S11dps_files_link -O /tmp/S11dps_files_link
  chmod +x /tmp/S11dps_files_link
  rm -rf S11dps_files_link
  mv /tmp/S11dps_files_link /etc/init.d/S11dps_files_link
  sleep 0.5

  wget http://192.168.99.253:8000/init.d/S10dps_mount -O /tmp/S10dps_mount
  chmod +x /tmp/S10dps_mount
  rm -rf S10dps_mount
  mv /tmp/S10dps_mount /etc/init.d/S10dps_mount

  wget http://192.168.99.253:8000/init.d/S99init_powersupply_pi -O /tmp/S99init_powersupply_pi
  chmod +x /tmp/S99init_powersupply_pi
  rm -rf S99init_powersupply_pi
  mv /tmp/S99init_powersupply_pi /etc/init.d/S99init_powersupply_pi
  sleep 0.5

cd ..

echo "done"