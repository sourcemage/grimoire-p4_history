#!/bin/sh

case  $1  in
  start|restart)  echo   "$1ing Internet superserver, xinetd."
                  pkill  "^xinetd$"  &&  sleep  3
                  xinetd -reuse
                  ;;
           stop)  echo   "$1ping xinetd."
                  pkill  "^xinetd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
