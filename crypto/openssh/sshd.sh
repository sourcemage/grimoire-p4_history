#!/bin/sh

case $1 in
     start|restart)  echo   "$1ing sshd."
		     if [ -e /var/run/sshd.pid ]; then
                       kill `cat /var/run/sshd.pid`
		       sleep 1
		     fi
                     sshd
                     ;;
              stop)  echo   "$1ping sshd."
                     kill `cat /var/run/sshd.pid`
                     ;;
                 *)  echo   "Usage: $0 {start|stop|restart}"
                     ;;
esac
