#!/bin/sh
#
# Source Mage init.d installer information
# SMGL-START:S:S80
# SMGL-STOP:0 6:K20
#

case $1 in
     start|restart)  echo   "$1ing crond periodic scheduler."
                     pkill  "^crond$"
                     crond
                     ;;
              stop)  echo   "$1ing crond."
                     pkill  "^crond$"
                     ;;
                 *)  echo   "Usage: $0 {start|stop|restart}"
                     ;;
esac
