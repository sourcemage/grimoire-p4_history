#!/bin/sh

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
