#!/bin/bash
# /etc/init.d/networking.sh
# SGL-script-version=20020924
# this sets the run levels and priority for links
# SGL-START:3 4 5:S30
# SGL-STOP:0 1 2 6:K70
# this script requires a file in /etc/sysconfig/network
# for each network device, with the same name as the device
# with the following variables set as needed:
# MODULE=
# MODE=dynamic if you use dhcpcd
# MODE=static if you do not
# The following is needed only if you do not use dhcpcd
# IP=
# BROADCAST=
# NETMASK=
# GATEWAY=

. /etc/init.d/functions
netdevdir=/etc/sysconfig/network

#change this if your .pid file hides somewhere else

DHCPD_PATH="/etc/dhcpc/dhcpcd-"

# this provides you with the ability to start/stop/check status on 
# one or more cards if you so desire.

if [ $# -le 2 ]; then
    devices=$(ls $netdevdir | grep ^eth)
else
    devices=$(echo $@ | sed s/$1//)
fi

case "$1" in
    start)
	for DEVICE in $devices; do
	    if [ -f $netdevdir/$DEVICE ]; then
		unset MODE MODULE IP BROADCAST NETMASK GATEWAY
		. $netdevdir/$DEVICE
		if [ -z "$MODE" ] || [ -z "$MODULE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE"
		else
		    echo "$1ing $0 with $DEVICE ..."
		    loadproc modprobe  $MODULE
		    if [ `echo $MODE` = dynamic ]; then
			echo "$1ing dhcpcd on $DEVICE ..."
			if [ -e $DHCPD_PATH$DEVICE.pid ]; then
			    dhcpcPid=`cat $DHCPD_PATH$DEVICE.pid`
			    dhcpcd -k $DEVICE 1>/dev/null 2>&1
			    renice 10 $dhcpcPid 1>/dev/null 2>&1 || rm -f $DHCPD_PATH$DEVICE.pid
			    sleep 1
			fi
			loadproc dhcpcd $DEVICE 
		    elif [ `echo $MODE` = static ]; then
			echo "Setting up static network on $DEVICE"
			ifconfig  $DEVICE $IP broadcast $BROADCAST netmask $NETMASK
			route add default gateway $GATEWAY
			evaluate_retval
		    else 
			echo " There are errors in $netdevdir/$DEVICE"
		    fi
		fi
	    fi
	done
	;;

    stop)
	for DEVICE in $devices; do
	    if [ -f $netdevdir/$DEVICE ]; then
		unset MODE MODULE IP BROADCAST NETMASK GATEWAY
		. $netdevdir/$DEVICE
# this is probably unnecessary since these checks were made during start, but...
		if [ -z "$MODE" ] || [ -z "$MODULE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE"
		else
		    if [ `echo $MODE` = dynamic ]; then 
			echo "$1ping dhcpcd on $DEVICE ..."
			dhcpcd -k $DEVICE
			evaluate_retval
			sleep 2
		    else
			ifconfig $DEVICE down
		    fi
		    echo "$1ping $0 on $DEVICE ..."
		    modprobe -r $MODULE
		    evaluate_retval
		fi
	    fi
	done
	;;

    restart)
	$0 stop
	sleep 1
	$0 start
	;;

    status)
	for DEVICE in $devices; do
	    unset MODE MODULE IP BROADCAST NETMASK GATEWAY
	    . $netdevdir/$DEVICE
		if [ -z "$MODE" ] || [ -z "$MODULE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE"
		else
		    if [ `echo $MODE` = dynamic ]; then
			statusproc dhcpcd
		    fi
		    ifconfig $DEVICE
		fi
	done
	;;

    *)
	echo "Usage: $0 {start|stop|restart|status}"
	exit 1
	;;
esac
