#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S60
# SMGL-STOP:0 1 2 6:K10
#

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

