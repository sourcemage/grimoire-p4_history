#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
#

PIDFILE=/var/run/ntpd.pid

case $1 in
start)
	echo "$1ing NTP daemon"
	ntpd -p $PIDFILE
	;;
restart)
	$0 stop
	$0 start
	;;
stop)
	if [ -f $PIDFILE ]; then
		echo "$1ping NTP daemon"
		kill `cat $PIDFILE`
	fi
	;;
*)
	echo "Usage: $0 {start|stop|restart}"
	;;
esac
