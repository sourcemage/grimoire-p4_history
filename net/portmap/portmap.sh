#!/bin/sh

case $1 in
  start|restart)  echo "$1ing portmap."
                  pkill  "^portmap$"  &&  sleep  5
                  /sbin/portmap
                  ;;

           stop)  echo "$1ping portmap."
                  pkill  "^portmap$"
                  ;;

              *)  echo  "Usage: $0 {start|stop|restart}"
                  ;;
esac
