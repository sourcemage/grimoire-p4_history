#!/bin/sh
source /etc/init.d/functions

case $1 in
      start)         echo "Starting crond periodic scheduler."
                     loadproc crond
                     ;;
      restart)       echo "Restarting crond periodic scheduler."
                     reloadproc crond  
                     ;;
      stop)          echo "Stoping crond periodic scheduler."
                     killproc crond
		     ;;
      status)        statusproc crond
                     ;;
         *)          echo   "Usage: $0 {start|stop|restart|status}"
                     exit 1
                     ;;
esac
