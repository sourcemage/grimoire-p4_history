#!/bin/sh
# FAGS startup script for Source Mage GNU/Linux
# chkconfig: 345 99 00

case $1 in
     start)    echo   "$1ing fags."
               su  fags  -c 'fags -b'

               ;;
     stop)     echo   "$1ping fags."
               pkill  '^fags$'

               ;;
     restart)  echo   "$1ing fags."
               $0 stop
               $0 start

               ;;
           *)  echo   "Usage: $0 {start|stop|restart}"
               ;;
esac
