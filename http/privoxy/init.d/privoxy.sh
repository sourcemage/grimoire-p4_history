#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030403
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

case $1 in
  start|restart)  echo   "$1ing Privoxy"
                  pkill  "^privoxy$"
                  privoxy /etc/privoxy/config &
                  ;;
           stop)  echo   "$1ing Privoxy"
                  pkill  "^privoxy$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
