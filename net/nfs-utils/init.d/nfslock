#!/bin/sh

# SMGL-script-version=20030225
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

case $1 in
  start|restart)  echo   "$1ing NFS file locking services, rpc.statd"
                  pkill  "^rpc.statd$"  &&  sleep  5
                  ps  -C  portmap  >  /dev/null  ||
                  /usr/sbin/portmap
                  /usr/sbin/rpc.statd
                  ;;
           stop)  echo "$1ping NFS file locking services"
                  pkill  "^rpc.statd$"
                  ;;
              *)  echo "Usage $0 {start|stop|restart}"
                  ;;
esac
