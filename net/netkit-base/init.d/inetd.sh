#!/bin/sh

# SMGL-script-version=20030225
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

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
