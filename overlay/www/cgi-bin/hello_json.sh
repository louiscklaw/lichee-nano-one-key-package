#!/bin/sh

# http://www.yolinux.com/TUTORIALS/BashShellCgi.html

# http://192.168.99.250/cgi-bin/hello_json.sh?namex=ferret&namez=valuez&namey=valuey
# http://192.168.99.250/cgi-bin/hello_json.sh?namex=on&namez=valuez&namey=valuey


echo "Content-Type: text/json"
echo ""

# Save the old internal field separator.
  OIFS="$IFS"

# Set the field separator to & and parse the QUERY_STRING at the ampersand.
  IFS="${IFS}&"
  set $QUERY_STRING
  Args="$*"
  IFS="$OIFS"

# Next parse the individual "name=value" tokens.

  ARGX=""
  ARGY=""
  ARGZ=""

  for i in $Args ;do

#       Set the field separator to =
        IFS="${OIFS}="
        set $i
        IFS="${OIFS}"

        case $1 in
                # Don't allow "/" changed to " ". Prevent hacker problems.
                namex) ARGX="`echo $2 | sed 's|[\]||g' | sed 's|%20| |g'`"
                       ;;
                # Filter for "/" not applied here
                namey) ARGY="`echo $2 | sed 's|%20| |g'`"
                       ;;
                namez) ARGZ="${2/\// /}"
                       ;;
                *)     echo "<hr>Warning:"\
                            "<br>Unrecognized variable \'$1\' passed by FORM in QUERY_STRING.<hr>"
                       ;;

        esac
  done

  # echo 'Parsed Values:'
  # echo '<br>'
  # echo $ARGX
  # echo '<br>'
  # echo $ARGY
  # echo '<br>'
  # echo $ARGZ

  if [ $ARGX == "off" ]; then
    /overlay/www/cgi-bin/hello_uart_off
  fi

  if [ $ARGX == "on" ]; then
    /overlay/www/cgi-bin/hello_uart

    exit 0
  fi

echo "{\"status\":\"failed, cannot find matching function\"}"

exit 0