#!/bin/sh
#
# Source Mage init.d startup information
# SMGL-START:4 5 6:S80
# SMGL-STOP:0 6:K10
#

case $1 in
  start|restart)  echo     "$1ing netatalk daemons."
                  pkill    "^afpd$"
                  /usr/sbin/afpd
                  ;;

   stop)          pkill    "^afpd$"
                  ;;

      *)          echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
