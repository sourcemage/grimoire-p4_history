#!/bin/sh
       case "$1" in
           start)
               echo "Starting noip."
               /usr/bin/noip -c /etc/no-ip.conf
           ;;
           stop)
               echo -n "Shutting down noip."
               killall -TERM noip
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
