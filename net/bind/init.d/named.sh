#!/bin/sh

# SMGL-script-version=20030304
# SMGL-START:3 4 5:S35
# SMGL-STOP:0 1 2 6:K50

. /etc/init.d/functions

case  $1  in
    start)  echo   "Starting Berkley Internet Name Domain"
            loadproc named -u bind
            ;;

   reload)  echo   "Reloading Berkley Internet Name Domain"
            reloadproc named SIGHUP
            ;;

  restart)  $0 stop
            $0 start
            ;;

     stop)  echo    "Stopping Berkley Internet Name Domain"
            loadproc rndc stop
            ;;

        *)  echo  "Usage: $0 {start|stop|restart}"
            ;;
esac
