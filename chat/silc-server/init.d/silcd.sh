#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:1 2 3 4 5:S90
# SMGL-STOP:0 6:K50

. /etc/init.d/functions


case $1 in
     start|restart)  echo   "$1ing silcd secure conferencer."
                     killproc  silcd
                     loadproc silcd
                     ;;
              stop)  echo   "$1ping silcd."
                     killproc silcd
                     ;;
                 *)  echo   "Usage: $0 {start|stop|restart}"
				     exit 1
                     ;;
esac
