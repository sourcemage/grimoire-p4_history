#!/bin/sh

# SMGL-script-version=20030318
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K70

. /etc/init.d/functions

case "$1" in
  start)    echo "Starting noip..."
            loadproc noip2 -c /etc/no-ip2.conf
            ;;
  stop)     echo "Stopping noip..."
            killproc noip2
            ;;
  restart)  $0 stop
            sleep 3
            $0 start
            ;;
  status)   statusproc noip2
            ;;
  *)        echo "Usage: $0 {start|stop|restart|status}"
            exit 1
            ;;
esac
