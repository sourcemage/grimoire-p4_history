#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
#

if [ ! -e /etc/pure-ftpd.conf ]; then
  echo "Warning: /etc/pure-ftpd.conf missing..."
  echo "pure-ftpd initscript stopped."
  exit 1
fi

source /etc/pure-ftpd.conf

case $1 in
start|restart|reload) echo   "$1ing pure-ftpd, ftp daemon."
                      pkill  "^pure-ftpd$"  &&  sleep  5
                      pure-ftpd $CONFIG
                      ;;
                stop) echo   "$1ping pure-ftpd."
                      pkill  "^pure-ftpd$"
                      ;;
                  *)  echo   "Usage: $0 {start|stop|restart|reload}"
                      ;;
esac
