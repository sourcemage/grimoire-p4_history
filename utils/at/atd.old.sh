#!/bin/sh

case $1 in
  start|restart)  echo   "$1ing atd periodic scheduler."
                  pkill  "^atd$"
                  atd
                  ;;
           stop)  echo   "$1ping atd."
                  pkill  "^atd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
