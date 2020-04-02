#!/bin/sh

# python -m SimpleHTTPServer 8000
# in directory /home/logic/_workspace/lichee-nano-one-key-package/overlay
set -xe

cd /overlay
  wget http://192.168.99.253:8000/refresh_binary.sh -O /tmp/refresh_binary.sh
  rm -rf refresh_binary.sh
  mv /tmp/refresh_binary.sh ./refresh_binary.sh
  chmod +x refresh_binary.sh
  sleep 0.5

  rm -rf refresh.sh
  wget http://192.168.99.253:8000/www/cgi-bin/refresh.sh -O /tmp/refresh.sh
  rm -rf /overlay/www/cgi-bin/refresh.sh
  mv /tmp/refresh.sh /overlay/www/cgi-bin/refresh.sh
  chmod +x /overlay/www/cgi-bin/refresh.sh
  sleep 0.5

cd ..

sleep 1

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

cd /overlay/www
  # index.html
  wget http://192.168.99.253:8000/www/index.html -O /tmp/index.html
  chmod +x /tmp/index.html

  rm -rf /overlay/www/index.html
  mv /tmp/index.html /overlay/www/index.html
  sleep 0.5
  rm -rf /tmp/index.html

cd ../..

cd /overlay/www/cgi-bin
  # hello_json.sh
  rm -rf /tmp/hello_json.sh
  wget http://192.168.99.253:8000/www/cgi-bin/hello_json.sh -O /tmp/hello_json.sh
  chmod +x /tmp/hello_json.sh

  rm -rf /overlay/www/cgi-bin/hello_json.sh
  mv /tmp/hello_json.sh /overlay/www/cgi-bin/hello_json.sh
  cp /overlay/www/cgi-bin/hello_json.sh /tmp/www/cgi-bin/hello_json.sh
  sleep 0.5

  rm -rf /tmp/set_voltage
  wget http://192.168.99.253:8000/www/cgi-bin/set_voltage -O /tmp/set_voltage
  chmod +x /tmp/set_voltage
  rm -rf /overlay/www/cgi-bin/set_voltage
  mv /tmp/set_voltage /overlay/www/cgi-bin/set_voltage
  cp /overlay/www/cgi-bin/set_voltage /tmp/www/cgi-bin/set_voltage
  sleep 0.5

  # /home/logic/_workspace/lichee-nano-one-key-package/overlay/www/cgi-bin/change_settings.sh
  rm -rf /tmp/change_settings.sh
  wget http://192.168.99.253:8000/www/cgi-bin/change_settings.sh -O /tmp/change_settings.sh
  chmod +x /tmp/change_settings.sh
  rm -rf /overlay/www/cgi-bin/change_settings.sh
  mv /tmp/change_settings.sh /overlay/www/cgi-bin/change_settings.sh
  sleep 0.5
  cp /overlay/www/cgi-bin/change_settings.sh /tmp/www/cgi-bin/change_settings.sh
  rm -rf /tmp/change_settings.sh

  # /home/logic/_workspace/lichee-nano-one-key-package/overlay/www/cgi-bin/change_settings.sh
  rm -rf /tmp/hello_uart_off
  wget http://192.168.99.253:8000/www/cgi-bin/hello_uart_off -O /tmp/hello_uart_off
  chmod +x /tmp/hello_uart_off
  rm -rf /overlay/www/cgi-bin/hello_uart_off
  mv /tmp/hello_uart_off /overlay/www/cgi-bin/hello_uart_off
  sleep 0.5
  cp /overlay/www/cgi-bin/hello_uart_off /tmp/www/cgi-bin/hello_uart_off

cd ../../..

cd /overlay
  rm -rf send_slack.sh
  wget http://192.168.99.253:8000/utils/send_slack.sh
  chmod +x send_slack.sh
  rm -rf /overlay/utils/send_slack.sh
  mv send_slack.sh /overlay/utils/send_slack.sh
  sleep 0.5

  rm -rf send_slack_module_ready.sh
  wget http://192.168.99.253:8000/utils/send_slack_module_ready.sh
  chmod +x send_slack_module_ready.sh
  rm -rf /overlay/utils/send_slack_module_ready.sh
  mv send_slack_module_ready.sh /overlay/utils/send_slack_module_ready.sh
  sleep 0.5

  rm -rf send_slack_job_done.sh
  wget http://192.168.99.253:8000/utils/send_slack_job_done.sh
  chmod +x send_slack_job_done.sh
  rm -rf /overlay/utils/send_slack_job_done.sh
  mv send_slack_job_done.sh /overlay/utils/send_slack_job_done.sh
  sleep 0.5

  rm -rf send_slack_httpd_started.sh
  wget http://192.168.99.253:8000/utils/send_slack_httpd_started.sh
  chmod +x send_slack_httpd_started.sh
  rm -rf /overlay/utils/send_slack_httpd_started.sh
  mv send_slack_httpd_started.sh /overlay/utils/send_slack_httpd_started.sh
  sleep 0.5

  rm -rf send_slack_helloworld.sh
  wget http://192.168.99.253:8000/utils/send_slack_helloworld.sh
  chmod +x send_slack_helloworld.sh
  rm -rf /overlay/utils/send_slack_helloworld.sh
  mv send_slack_helloworld.sh /overlay/utils/send_slack_helloworld.sh
  sleep 0.5

  # wget http://192.168.99.253:8000/react_client.zip -O /tmp/react_client.zip
  # rm -rf react_client.zip
  # mv /tmp/react_client.zip ./react_client.zip
  # chmod +x react_client.zip
  # rm -rf /tmp/react_client.zip

  # rm -rf /tmp/powersupply-pi-client
  # unzip -o /overlay/react_client.zip -d /tmp

  rm -rf init_main.sh
  wget http://192.168.99.253:8000/init_main.sh
  sleep 0.1
  chmod +x init_main.sh

cd ..

echo "done"