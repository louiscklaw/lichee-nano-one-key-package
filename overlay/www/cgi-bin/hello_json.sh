#!/bin/sh

# export PATH=/overlay/www/cgi-bin:$PATH

/overlay/www/cgi-bin/hello_uart_off

echo "Content-Type: text/json"
echo "export"
echo "{\"success\":\"true\"}"