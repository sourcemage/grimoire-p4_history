#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing postfix MTA."
                  postfix  stop  2>/dev/null
                  newaliases
                  postfix  start
                  ;;
           stop)  echo     "$1ing postfix"
                  postfix  stop
                  ;;
              *)  echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
