#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:2 3 4 5:S10
# SMGL-STOP:0 1 6:K75
#

LOGCONSOLE=/devices/vc/10

case $1 in
    start)  echo      "$1ing to pipe syslogs to $LOGCONSOLE."
             /bin/tail -n 64 -f /var/log/messages | logcolorise.pl > $LOGCONSOLE &
            ;;
              
     stop)  echo      "$1ping syslogs to $LOGCONSOLE."
           killall logcolorise.pl
           killall tail
            ;;

        *)  echo  "Usage: /usr/sbin/cast {start|stop}"
            ;;
esac
