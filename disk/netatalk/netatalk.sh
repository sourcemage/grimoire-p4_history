#!/bin/sh

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
