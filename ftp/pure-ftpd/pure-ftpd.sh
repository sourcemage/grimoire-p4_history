#!/bin/sh

case $1 in
  start|restart)  echo   "$1ing pure-ftpd, ftp daemon."
                  pkill  "^pure-ftpd$"  &&  sleep  5
                  pure-ftpd -b -B
                  ;;
           stop)  echo   "$1ping pure-ftpd."
                  pkill  "^pure-ftpd$"  
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
