#!/bin/sh

case $1 in
  start|restart)  echo  -n  "$1ing rpc.dracd daemon: "
                  pkill  "^rpc.dracd$"  &&  sleep  5
                  rpc.dracd &
                  ;;

           stop)  echo  -n  "$1ing rpc.dracd daemon: "
                  pkill "^rpc.dracd$"
                  ;;

              *)  echo  "Usage: dracd {start|stop|restart}"
                  exit  1
                  ;;
esac
