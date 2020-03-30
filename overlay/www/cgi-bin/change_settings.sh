#!/bin/sh

export PATH=/overlay/www/cgi-bin:$PATH

eval `echo "${QUERY_STRING}"|tr '&' ';'`

set_voltage /dev/ttyS1 $voltage $current
# set_voltage /dev/ttyS1 4000 1234

# echo "Content-type: text/html"
# echo ""
# echo "<html><head><title>Bash as CGI"
# echo "</title></head><body>"
# echo "<h1>Hello world</h1>"
# echo "Today is $(date)"
# echo "<pre>"
# echo voltage=$voltage
# echo current=$current
# echo "</pre>"
# echo "</body></html>"

echo "Content-type: text/html"
echo ""
echo "<html>Bash as CGI</html>"