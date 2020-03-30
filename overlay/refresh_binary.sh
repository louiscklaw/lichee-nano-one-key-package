#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay
set -xe

rm -rf refresh_binary.sh
wget http://192.168.99.253:8000/refresh_binary.sh
sleep 0.1
chmod +x refresh_binary.sh

rm -rf refresh.sh
wget http://192.168.99.253:8000/www/cgi-bin/refresh.sh
chmod +x refresh.sh
rm -rf /overlay/www/cgi-bin/refresh.sh
mv refresh.sh /overlay/www/cgi-bin/refresh.sh

rm -rf set_voltage
wget http://192.168.99.253:8000/www/cgi-bin/set_voltage
chmod +x set_voltage
rm -rf /overlay/www/cgi-bin/set_voltage
mv set_voltage /overlay/www/cgi-bin/set_voltage

# /home/logic/_workspace/lichee-nano-one-key-package/overlay/www/cgi-bin/change_settings.sh
rm -rf change_settings.sh
wget http://192.168.99.253:8000/www/cgi-bin/change_settings.sh
chmod +x change_settings.sh
rm -rf /overlay/www/cgi-bin/change_settings.sh
mv change_settings.sh /overlay/www/cgi-bin/change_settings.sh

echo "done"