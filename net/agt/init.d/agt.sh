#!/bin/bash
#
# agt.sh - Handles loading of agt rules.
#
# SMGL-script-version=20030313
# SMGL-START:3 4 5:S31
# SMGL-STOP:0 1 2 6:K69

. /etc/init.d/functions

AGT=/usr/sbin/agt

case "$1" in
  start)    echo  "Loading agt rules..."
            $AGT > /dev/null 2>&1
            evaluate_retval
            ;;

  stop)     echo  "Flushing agt rules..."
            $AGT -f /dev/null > /dev/null 2>&1
            evaluate_retval
            ;;

  restart)  $0 stop
            sleep 2
            $0 start
            ;;

  *)        echo  "Usage: $0 {start|stop|restart}"
            exit 1
            ;;
esac
