#!/bin/sh

# SMGL-script-version=20030603
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

. /etc/init.d/functions

case $1 in
  start)    echo   "Starting Internet superserver, inetd..."
            loadproc inetd
            ;;

  stop)     echo   "Stopping Internet superserver, inetd..."
            killproc inetd
            ;;

  restart)  $0 stop
            sleep 2
            $0 start
            ;;

  reload)   echo "Reloading inetd configuration..."
            reloadproc inetd
            ;;

  status)   statusproc inetd
            ;;

  *)        echo   "Usage: $0 {start|stop|restart|reload|status}"
            ;;
esac
