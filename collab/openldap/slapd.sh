#!/bin/sh
# $Id: slapd.sh,v 1.3 2002/07/29 23:53:53 sergeyli Exp $

# remove ldaps part if you don't want to slapd to listen
# on ldaps port, i.e. if ssl/tls support is not compiled in
SLAPD_URL="ldap:// ldaps://"

case $1 in
	restart)
		$0     stop
		sleep  2
		$0     start
		;;
	start)
		echo   "$1ing slapd OpenLDAP deamon."
		slapd  -h  "$SLAPD_URL"
		;;
	stop)
		echo   "$1ping slapd."
		pkill  "^slapd$"
		;;
	*)
		echo   "Usage: $0 {start|stop|restart}"
		;;
esac
