#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

source /etc/init.d/functions

case  $1  in
	start)
		echo "Starting Internet superserver, xinetd..."
		loadproc xinetd -reuse
		;;
	stop)
		echo "Stopping xinetd..."
		killproc xinetd
		;;
	restart)
		echo "Restarting xinetd..."
		$0 stop
		/usr/bin/sleep 1
		$0 start
		;;
	status)
		statusproc xinetd
		;;
	*)
		echo   "Usage: $0 {start|stop|restart|status}"
		;;
esac
