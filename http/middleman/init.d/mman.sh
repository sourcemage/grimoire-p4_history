#!/bin/bash
#
# mman.sh - init.d script for Middleman
#
# SMGL-script-version=20030311
# SMGL-START:3 4 5:S35
# SMGL-STOP:0 1 2 6:K65

. /etc/init.d/functions

case "$1" in
  start)    echo  "Starting Middleman..."
            loadproc mman -c /etc/mman.conf -l /var/log/mman -d 2047
            ;;

  stop)     echo  "Stopping Middleman..."
            killproc mman
            ;;

  restart)  $0 stop
            sleep 2
            $0 start
            ;;

  status)   statusproc mman
            ;;

  *)        echo  "Usage: $0 {start|stop|restart|status}"
            exit 1
            ;;
esac
