#!/bin/sh

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
