#!/bin/sh

case $1 in
  start|restart)  echo   "$1ing fcron periodic scheduler."
                  pkill  "^fcron$"
                  fcron  -b
                  ;;
           stop)  echo   "$1ing fcron."
                  pkill  "^fcron$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
