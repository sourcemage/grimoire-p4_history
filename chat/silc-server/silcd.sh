#!/bin/sh

case $1 in
     start|restart)  echo   "$1ing silcd secure conferencer."
                     pkill  "^silcd$"
                     silcd
                     ;;
              stop)  echo   "$1ping silcd."
                     pkill  "^silcd$"
                     ;;
                 *)  echo   "Usage: $0 {start|stop|restart}"
                     ;;
esac
