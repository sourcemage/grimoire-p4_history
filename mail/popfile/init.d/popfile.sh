#!/bin/sh
#
#   Startup/shutdown script for popfile
#
#
# Start or stop popfile based upon the first argument to the script.
#

source /etc/init.d/functions

# this sets the run levels and priority for links
# SGL-START:3 5:S99
# SGL-STOP:0 1 2 6:K00

case $1 in
	start)
		echo "Starting popfile"
		cd /usr/share/popfile/
		loadproc ./popfile.pl &
		evaluate_retval
	 	cp /usr/share/popfile/popfile.pid /var/run 1>/dev/null 2>&1
		echo " "
		;;

 	stop)
                echo "Stopping popfile"
		killproc /usr/share/popfile/popfile.pl
		evaluate_retval
		echo " "
		rm -f /usr/share/popfile/popfile.pid
                ;;

        restart|reload)
                echo "Restarting popfile"
	        $0 stop
        	$0 start
		evaluate_retval
                ;;
        *)
                echo "Usage: $0 {start|stop|restart}"
                exit 1
		;;
esac
# end of procfile startup script
