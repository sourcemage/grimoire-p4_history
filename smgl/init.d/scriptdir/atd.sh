#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:S:S80
# SMGL-STOP:0 6:K20

source /etc/init.d/functions

case $1 in
        start)    echo "Starting atd periodic scheduler."
                  loadproc atd
                  ;;
        restart)  echo "Restarting atd periodic scheduler."
	          reloadproc atd
		  ;;

        stop)     echo "stopping atd."
                  killproc atd
                  ;;
        status)   statusproc atd
                  ;;
        *)        echo   "Usage: $0 {start|stop|restart|status}"
	          exit 1
                  ;;
esac
