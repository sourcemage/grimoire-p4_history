#!/bin/sh

# SMGL-script-version=20030304
# SMGL-START:3 4 5:S35
# SMGL-STOP:0 1 2 6:K50

case  $1  in
    start)  echo   "Starting Berkley Internet Name Domain"
            named  -u  bind                         ;;

  restart)  rndc    stop
            named  -u  bind                         ;;

     stop)  rndc   stop                             ;;

        *)  echo  "Usage: $0 {start|stop|restart}"  ;;

esac
