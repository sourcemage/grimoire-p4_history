#!/bin/sh
#
# Updated uptimed script
# Changes:
# 1. fixed messages
# 2. added function file
# 3. split start / restart cases
# 4. added status case

source /etc/init.d/functions

case  $1 in
    start)
	echo   "Starting Uptime Daemon..."
	loadproc uptimed -b
	loadproc uptimed -i 60 -p /var/run/uptimed
	;;
    stop)
	echo   "Stopping Uptime Daemon..."
	killproc uptimed
	;;
    restart)
	echo "Restarting Uptime Daemon"
	$0 stop
	/usr/bin/sleep 1
	$0 start
	;;
    status)
	statusproc uptimed
	;;
    *)
	echo   "Usage: $0 {start|stop|restart|status}"
	exit 1
	;;
esac
# end of uptimed startup script