#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay

rm -rf set_voltage

wget http://192.168.99.253:8000/www/cgi-bin/set_voltage
chmod +x set_voltage
