#!/bin/sh
# chkconfig: 2345 10 90
# description: chronyd helps keep the system time accurate by calculating \
#              and applying correction factors to compensate for the drift \
#              in the clock. chronyd can also correct the hardware clock \
#              (RTC) on some systems.
# processname: chronyd
# config: /etc/chrony.conf

. /etc/init.d/functions
PIDFILE=/var/run/chronyd.pid

case $1 in
start)
	echo "$1ing chrony daemon"
	chronyd
	;;
restart)
	$0 stop
	$0 start
	;;
stop)
	if [ -f $PIDFILE ]; then
		echo "$1ping chrony daemon"
		kill `cat $PIDFILE`
	fi
	;;
status)
	statusproc chronyd
	;;
*)
	echo "Usage: $0 {start|stop|status|restart}"
	;;
esac
