#!/bin/sh

case  $1 in
  start|restart)  echo   "$1ing Console Mouse Daemon"
                  pkill  "^uptimed$"
                  uptimed -b
		  uptimed -i 60 -p /var/run/uptimed
                  ;;
           stop)  echo   "$1ing Console Mouse Daemon"
                  pkill  "^uptimed$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
