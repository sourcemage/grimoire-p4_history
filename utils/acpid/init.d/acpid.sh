#!/bin/bash
#
# Starts the acpi daemon
# description: Listen and dispatch ACPI events from the kernel
# processname: acpid

# Source function library.
. /etc/rc.d/functions

DAEMON=acpi
PROGNAME=${DAEMON}d
test -x /usr/sbin/$PROGNAME || exit 0

RETVAL=0

start() {
	# Check if it is already running
	if [ ! -f /var/lock/subsys/$PROGNAME ]; then
	    echo "Starting $DAEMON daemon: "
	    loadproc /usr/sbin/$PROGNAME
	    RETVAL=$?
	    [ $RETVAL -eq 0 ] && touch /var/lock/$PROGNAME
	fi
	return $RETVAL
}

stop() {
	echo "Stopping $DAEMON daemon: "
	killproc /usr/sbin/$PROGNAME
	RETVAL=$?
	[ $RETVAL -eq 0 ] && rm -f /var/lock/$PROGNAME
        return $RETVAL
}


restart() {
	stop
	start
}	

reload() {
	trap "" SIGHUP
	killall -HUP $PROGNAME
}	

case "$1" in
start)
	start
	;;
stop)
	stop
	;;
reload)
	reload
	;;
restart)
	restart
	;;
condrestart)
	if [ -f /var/lock/$PROGNAME ]; then
	    restart
	fi
	;;
status)
	status $PROGNAME
	;;
*)
	INITNAME=`basename $0`
	echo "Usage: $INITNAME {start|stop|restart|condrestart|status}"
	exit 1
esac

exit $RETVAL
