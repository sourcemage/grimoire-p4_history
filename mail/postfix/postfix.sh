#!/bin/sh

case $1 in
   start)  echo     "$1ing postfix MTA."
	   if [ -e /etc/aliases ]; then
	     if [ -e /etc/aliases.db ] &&
	        [ ""`/usr/bin/find /etc/aliases -follow -newer /etc/aliases.db` != "" ]; then
   	            echo "/etc/aliases is modified. You may want to run newaliases"
	     fi
           fi
           postfix  start
           ;;

    stop)  echo     "$1ing postfix"
           postfix  stop
           ;;

 restart)
	   $0 stop
	   $0 start
           ;;  

       *)  echo     "Usage: $0 {start|stop|restart}"
           ;;
esac
