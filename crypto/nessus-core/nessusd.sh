#!/bin/sh

case  $1  in
  start|restart)  echo   "$1ing nessusd, the server part of the Nessus Security Scanner"
                  pkill  "^nessusd$"
                  nessusd -D
                  ;;
           stop)  echo   "$1ing nessusd, the server part of the Nessus Security Scanner"
                  pkill  "^nessusd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
