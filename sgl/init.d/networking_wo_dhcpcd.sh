#!/bin/bash
#

source /etc/init.d/functions

DEVICE=eth0
IP=192.168.2.90
BROADCAST=192.168.2.255
NETMASK=255.255.255.0
GATEWAY=192.168.2.1
MODULE=tulip
# DHCPD_PATH="/etc/dhcpc/dhcpcd-"

case "$1" in
	start)
		echo "Starting networking on $DEVICE ..."
                loadproc modprobe  $MODULE
                ifconfig  $DEVICE $IP broadcast $BROADCAST netmask $NETMASK
                route     add default gateway $GATEWAY
#                echo "Starting dhcpcd on $DEVICE ..."
#		if [ -e $DHCPD_PATH$DEVICE.pid ]; then
#		    dhcpcPid=`cat $DHCPD_PATH$DEVICE.pid`
#		    dhcpcd -k $DEVICE 1>/dev/null 2>&1
#		    renice 10 $dhcpcPid 1>/dev/null 2>&1 || rm -f $DHCPD_PATH$DEVICE.pid
#		    sleep 1
#		fi
#                loadproc dhcpcd $DEVICE -H
		;;

	stop)
#               echo "Stopping dhcpcd on $DEVICE ..."
#		dhcpcd -k $DEVICE
#		evaluate_retval
#		sleep 2
		echo "Stopping networking on $DEVICE ..."
                ifconfig  $DEVICE down
                modprobe -r $MODULE
		sleep 2
		evaluate_retval
		;;

	restart)
		$0 stop
		sleep 1
		$0 start
		;;

	status)
#                ifconfig
#		statusproc dhcpcd
	       netstat -s
		;;

	*)
		echo "Usage: $0 {start|stop|restart|status}"
		exit 1
		;;
esac
