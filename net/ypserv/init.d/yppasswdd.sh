#!/bin/sh

# SMGL-script-version=20030225
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6 S:K60

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
