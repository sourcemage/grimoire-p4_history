#!/bin/sh

case  $1  in
  start|restart)  echo "$1ing ddclient"
                  pkill  "^ddclient$"  &&  sleep  3
                  ddclient -daemon 300
                  ;;

           stop)  echo "$1ping ddclient"
                  pkill  "^ddclient$"
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
