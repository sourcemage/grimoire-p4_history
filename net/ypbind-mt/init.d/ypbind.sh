#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

NISDOMAIN=`cat  /etc/nisdomain`

case $1 in
  start|restart)  echo   "$1ing ypbind."
                  pkill  "^ypbind$"  &&  sleep 2
                  ps  -C  portmap  >  /dev/null  ||  portmap
                  /bin/nisdomainname $NISDOMAIN
                  /usr/sbin/ypbind
                  ;;
              
           stop)  echo   "$1ping ypbind."
                  pkill  "^ypbind$"
                  ;;

              *)  echo  "Usage: $0 {start|stop|restart}"
                  ;;
esac
