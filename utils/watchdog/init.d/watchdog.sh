#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:3 4 5:S10
# SMGL-STOP:0 1 2 6:K90
#

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
