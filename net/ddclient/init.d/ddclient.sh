#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:3 4 5:S64
# SMGL-STOP:0 1 2 6:K35
#

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
