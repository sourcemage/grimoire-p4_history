#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:S:S80
# SMGL-STOP:0 6:K20

source /etc/init.d/functions

case $1 in
      start)
	  		echo "Starting crond periodic scheduler."
			loadproc crond
			;;
			
      stop)
	  		echo "Stopping crond periodic scheduler."
			killproc crond
			;;
			
      restart)
	  		echo "Restarting crond periodic scheduler."
			reloadproc crond
			;;
			
      status)
	  		statusproc crond
			;;

         *)
		 	echo   "Usage: $0 {start|stop|restart|status}"
			exit 1
			;;
esac
