#!/bin/sh
source /etc/init.d/functions

case $1 in
        start)
				echo "Starting atd periodic scheduler."
				loadproc atd
				;;
				
        stop)
				echo "stopping atd."
				killproc atd
				;;
				
        restart)
				echo "Restarting atd periodic scheduler."
				reloadproc atd
				;;

        status)
				statusproc atd
				;;

        *)
				echo   "Usage: $0 {start|stop|restart|status}"
				exit 1
				;;
esac
