#!/bin/sh
       case "$1" in
           start)
               echo "Starting noip."
               /usr/bin/noip2 -c /etc/no-ip2.conf
           ;;
           stop)
               echo "Shutting down noip."
               killall -TERM noip2
           ;;
	   restart)
	       $0 stop
	       sleep 3
	       $0 start
	   ;;
           *)
               echo "Usage: $0 {start|restart|stop}"
               exit 1
esac
exit 0
