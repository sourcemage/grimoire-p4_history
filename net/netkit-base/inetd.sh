#!/bin/sh

case $1 in
  start|restart)  echo   "$1ing Internet superserver, inetd."
                  pkill  "^inetd$"  &&  sleep 2
                  inetd
                  ;;
           stop)  echo   "$1ing inetd."
                  pkill  "^inetd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
