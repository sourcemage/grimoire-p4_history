#!/bin/sh

# SMGL-script-version=20030318
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

. /etc/init.d/functions

case $1 in
   start)  echo     "Starting postfix..."
	   if [ -e /etc/aliases ]; then
	     if [ -e /etc/aliases.db ] &&
	        [ ""`/usr/bin/find /etc/aliases -follow -newer /etc/aliases.db` != "" ]; then
   	            echo "/etc/aliases is modified. You may want to run newaliases"
	     fi
           fi
           loadproc  postfix  start
           ;;

    stop)  echo     "Stoping postfix..."
           postfix  stop
           loadproc true
           ;;

    restart)
	   			 $0 stop
            	sleep 1
	   			 $0 start
           ;;  
    reload) echo     "Reloading postfix..."
					 loadproc  postfix  reload
           ;;    
    status)
           statusproc master
           ;;
       *)  echo     "Usage: $0 {start|stop|restart|reload|status}"
           ;;
esac
