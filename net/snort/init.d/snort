#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

case $1 in
     start|restart)  echo   "$1ing Snort, Intrusion Detection System."
                     pkill  "^snort$"
                     snort  -TD
                     ;;
              stop)  echo   "$1ping Snort."
                     pkill  "^snort$"
                     ;;
                 *)  echo   "Usage: $0 {start|stop|restart}"
                     ;;
esac
