#!/bin/sh

case  $1  in
  start|restart)  echo "$1ing YP password services"
                  pkill  "^rpc.yppasswdd$"  &&  sleep  5
                  rpc.yppasswdd
                  ;;

           stop)  echo "$1ping YP password services"
                  pkill  "^rpc.yppasswdd$"
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
