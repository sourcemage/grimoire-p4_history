#!/bin/sh

case  $1  in
  start|restart)  echo "$1ing YP server"
                  pkill  "^ypserv$"  &&  sleep  5
                  ypserv
                  ;;

           stop)  echo "$1ping YP server"
                  pkill  "^ypserv$"
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
