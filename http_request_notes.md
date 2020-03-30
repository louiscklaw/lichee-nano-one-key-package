curl -X POST -d "gimmeflag=please" http://192.168.99.250/cgi-bin/hello_cgi.sh


curl http://192.168.99.250/cgi-bin/hello_cgi.sh\?hello\=world\&foo\=bar
curl http://192.168.99.250/cgi-bin/hello_cgi.sh\?voltage\=4000\&current\=1000

curl http://192.168.99.250/cgi-bin/hello_cgi.sh\?action\=change_setting\&voltage\=4000\&current\=1234

curl http://192.168.99.250/cgi-bin/change_settings.sh\?port\=ttyS0\&voltage\=4000\&current\=1234


# QUERY_STRING=voltage=4000\&current=1000
# echo $QUERY_STRING
voltage=4000&current=1000
# eval `echo "${QUERY_STRING}"|tr '&' ';'`
# echo $a

# echo $b

# echo $c

# eval `echo "${QUERY_STRING}"|tr '&' ';'`
# ${QUERY_STRING}|tr '&' ';'
-sh: voltage=4000&current=1000: not found
# "${QUERY_STRING}"|tr '&' ';'
-sh: voltage=4000&current=1000: not found
# "${QUE^C_STRING}"|tr '&' ';'
# echo "123321" |tr '1' 'a'
a2332a
# echo $QUERY_STRING |tr '1' 'a'
voltage=4000&current=a000
# echo $QUERY_STRING |tr '&' ';'
voltage=4000;current=1000
# e[ 1646.174855] RTL8723BS: send eapol packet
[ 1646.192743] RTL8723BS: set group key camid:5, addr:cc:2d:e0:da:9a:26, kid:1, type:AES
val `echo $QUERY_STRING |tr '&' ';'`
# eval `echo $QUERY_STRING |tr '&' ';'`
# echo $a

# echo $voltage
4000
# echo $current
1000
