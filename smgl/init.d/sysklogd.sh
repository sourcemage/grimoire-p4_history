#!/bin/sh
source /etc/init.d/functions

case $1 in
  		start)
				echo  "$1ing system and kernel log daemons."
                loadproc syslogd -m 60
                loadproc klogd
                ;;

		stop)
		   		echo  "Stopping system and kernel log daemons."
                killproc syslogd
                killproc klogd
                ;;
				
		restart)
				echo  "Restarting system and kernel log daemons."
				reloadproc syslogd
				reloadproc klogd
				;;

         status)
		 		statusproc syslogd
				statusproc klogd
				;;

		 *)  
		 		echo  "Usage: $0 {start|stop|restart|status}"
	          	exit 1
                ;;
esac
