#!/bin/bash
#

source /etc/init.d/functions

DEVICE=eth0
IP=
BROADCAST=
NETMASK=
GATEWAY=
MODULE=tulip
DHCPD_PATH="/etc/dhcpc/dhcpcd-"

case "$1" in
	start)
		echo "Starting networking on $DEVICE ..."
                loadproc modprobe  $MODULE
                # ifconfig  $DEVICE $IP broadcast $BROADCAST netmask $NETMASK
                # route     add default gateway $GATEWAY
                echo "Starting dhcpcd on $DEVICE ..."
		if [ -e $DHCPD_PATH$DEVICE.pid ]; then
		    dhcpcPid=`cat $DHCPD_PATH$DEVICE.pid`
		    dhcpcd -k $DEVICE 1>/dev/null 2>&1
		    renice 10 $dhcpcPid 1>/dev/null 2>&1 || rm -f $DHCPD_PATH$DEVICE.pid
		    sleep 1
		fi
                loadproc dhcpcd $DEVICE -H
		;;

	stop)
                echo "Stopping dhcpcd on $DEVICE ..."
                # ifconfig  $DEVICE down
		dhcpcd -k $DEVICE
		evaluate_retval
		sleep 2
		echo "Stopping networking on $DEVICE ..."
                modprobe -r $MODULE
		evaluate_retval
		;;

	restart)
		$0 stop
		sleep 1
		$0 start
		;;

	status)
                ifconfig
		statusproc dhcpcd
		;;

	*)
		echo "Usage: $0 {start|stop|restart|status}"
		exit 1
		;;
esac
