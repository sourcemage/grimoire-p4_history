#!/bin/sh

case  $1  in
  start|restart)  echo   "$1ing ntop, a network traffic usage monitor."
                  pkill  "^ntop$"
                  ntop   -d
                  ;;
           stop)  echo   "$1ing ntop."
                  pkill  "^ntop$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
