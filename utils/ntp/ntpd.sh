#!/bin/sh

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
