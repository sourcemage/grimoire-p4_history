#!/bin/sh
       case "$1" in
           start)
               echo "Starting watchdog."
# REMOVE -q to have a REAL watchdog. (-q means "simulating only")
               /usr/sbin/watchdog -q -v -c /etc/watchdog.conf 
           ;;
           stop)
               echo "Shutting down watchdog."
               thePid=`cat /var/run/watchdog.pid`
               kill -TERM $thePid
               sleep 1
           ;;
           restart)
               $0 stop
               $0 start
           ;;
           *)
               echo "Usage: $0 {start|restart|stop}"
               exit 1
esac
exit 0
