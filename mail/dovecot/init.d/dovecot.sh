#!/bin/sh

# SMGL-script-version=20030318
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

. /etc/init.d/functions


case $1 in
   start)  echo     "Starting dovecot..."
           loadproc dovecot -c /etc/dovecot.conf
           ;;

    stop)  echo     "Stopping dovecot..."
           killproc dovecot
           ;;

    restart|reload)
	   $0 stop
	   sleep 1
	   $0 start
           ;;  
    status)
	   statusproc dovecot
	   ;;
       *)  echo     "Usage: $0 {start|stop|restart|reload|status}"
           ;;
esac
