#!/bin/sh
#
# Updated xinetd script
# Changes:
# 1. added function file
# 2. split start / restart cases
# 3. added status case

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
