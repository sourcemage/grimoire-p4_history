#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

case $1 in
  start|restart)  echo   "$1ing rpc.bootparamd."
                  pkill  "^rpc.bootparamd$"  &&  sleep 2
                  ps  -C  portmap  >  /dev/null  ||  portmap
                  rpc.bootparamd
                  ;;
           stop)  echo   "$1ping rpc.bootparamd."
                  pkill  "^rpc.bootparamd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
