#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:1 2 3 4 5:S35
# SMGL-STOP:0 6:K50

. /etc/init.d/functions

# remove ldaps part if you don't want to slapd to listen
# on ldaps port, i.e. if ssl/tls support is not compiled in
SLAPD_URL='ldap:// ldaps://'

case $1 in
	restart)
		$0     stop
		sleep  2
		$0     start
		;;
	start)
		echo   "$1ing slapd OpenLDAP daemon"
		slapd  -h  "$SLAPD_URL"
		evaluate_retval
		;;
	stop)
		echo   "$1ping slapd"
		killproc  slapd
		;;
	*)
		echo   "Usage: $0 {start|stop|restart}"
		exit 1
		;;
esac
