#!/bin/sh

case  $1  in
  start|restart)  echo  "$1ing grtalkd."
                  pkill  "^grtalkd$"  &&  sleep 2
                  grtalkd
                  ;;
           stop)  echo  "$1ing grtalkd."
                  pkill  "^grtalkd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
