#!/bin/sh

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
