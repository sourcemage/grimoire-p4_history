#!/bin/sh
# $Id: mksscert.sh,v 1.1 2002/08/20 14:20:14 sergeyli Exp $

if [ -n "`find /etc/httpd -path \"*/ssl.*/server.*\"`" ]; then
	echo "${MESSAGE_COLOR}Certificate(s)/key(s) exist in /etc/httpd.${DEFAULT_COLOR}"
	exit
fi

mkdir -p /etc/httpd/ssl.key
mkdir -p /etc/httpd/ssl.crt
openssl genrsa -rand /var/log/wtmp:/var/log/syslog \
	-out  /etc/httpd/ssl.key/server.key 2048
chmod 400 /etc/httpd/ssl.key/server.key

message "${MESSAGE_COLOR}Specify your server's FQDN as Common Name (CN) below${DEFAULT_COLOR}"
message "${MESSAGE_COLOR}Key and certificate will ${PROBLEM_COLOR}NOT${MESSAGE_COLOR} be encrypted!${DEFAULT_COLOR}"
openssl req -new -x509 -days 3650       \
	-key  /etc/httpd/ssl.key/server.key \
	-out  /etc/httpd/ssl.crt/server.crt
chmod 400 /etc/httpd/ssl.crt/server.crt

