#!/bin/sh

case $1 in
        start)
                echo "starting dnsmasq."
                /usr/sbin/dnsmasq
                ;;
        stop)
                echo "stopping dnsmasq."
                killall dnsmasq
		;;
        restart)
                $0 stop &&
                $0 start
                ;;
        *)
                echo "Usage: $0 {start|stop|restart}"
esac

