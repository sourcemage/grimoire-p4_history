#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030418
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
#

source /etc/init.d/functions

case  $1  in
  start)    loadproc ntop -d -u nobody -w 0 -W 8080 --use-syslog=daemon
            ;;

  restart)  $0 stop
            $0 start
            ;;

  stop)     echo "Stopping ntop..."
            killproc ntop
            ;;

  status)   statusproc ntop
            ;;

  *)        echo "Usage: $0 {start|stop|restart|status}"
            ;;
esac
