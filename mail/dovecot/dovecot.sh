#!/bin/sh

case $1 in
   start)  echo     "$1ing dovecot."
           /usr/sbin/dovecot -c /etc/dovecot.conf
           pid=`pidof dovecot`
           if [ -n "$pid" ]; then
             echo "$pid" > /var/run/dovecot.pid
           else
             echo "dovecot startup failed."
           fi
           ;;

    stop)  echo     "$1ing dovecot."
           pid=`pidof dovecot`
           if [ -n "$pid" ]; then
             kill -15 `pidof dovecot` 
           else
             echo "dovecot is not running."
           fi
           rm -f /var/run/dovecot.pid
           ;;

 restart)
	   $0 stop
	   sleep 1
	   $0 start
           ;;  

       *)  echo     "Usage: $0 {start|stop|restart}"
           ;;
esac
