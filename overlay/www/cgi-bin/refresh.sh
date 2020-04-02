#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay
set -xe

rm -rf refresh.sh
wget http://192.168.99.253:8000/www/cgi-bin/refresh.sh
sleep 0.1
chmod +x refresh.sh

rm -rf set_voltage
wget http://192.168.99.253:8000/www/cgi-bin/set_voltage
sleep 0.1
chmod +x set_voltage

rm -rf change_settings.sh
wget http://192.168.99.253:8000/www/cgi-bin/change_settings.sh
sleep 0.1
chmod +x change_settings.sh
