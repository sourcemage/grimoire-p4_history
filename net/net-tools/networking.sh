#!/bin/bash
# /etc/init.d/networking.sh
# SGL-script-version=20030117
# set the above to custom instead of date format if you use
# a custom networking script
# this sets the run levels and priority for links
# SGL-START:3 4 5:S30
# SGL-STOP:0 1 2 6:K70
# this script requires a file in /etc/sysconfig/network
# for each network device named <device>.dev
# with the following variables set as needed:
# MODULE=
# leave MODULE= blank if device driver built into the kernel
# MODE=dynamic if you use dhcpcd
# MODE=static if you do not
# The following is needed only if MODE=static
# IP=
# BROADCAST=
# NETMASK=
# GATEWAY=
# Leave GATEWAY= blank if your gateway is set by another program.

. /etc/init.d/functions
netdevdir=/etc/sysconfig/network

#change this if your .pid file hides somewhere else

DHCPCD_PATH="/etc/dhcpc/dhcpcd-"

# this provides you with the ability to start/stop/check status on 
# one or more cards if you so desire.

if [ $# -le 2 ]; then
    devices=$(ls $netdevdir | grep dev$ | cut -d. -f1)
else
    devices=$(echo $@ | sed s/$1//)
fi

case "$1" in
    start)
	for DEVICE in $devices; do
	    if [ -f $netdevdir/$DEVICE.dev ]; then
		unset MODE MODULE IP BROADCAST NETMASK GATEWAY
		. $netdevdir/$DEVICE.dev
		if [ -z "$MODE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE.dev"
		else
# only load module if necessary; i.e. not built into kernel.
		    if [ ! -z "$MODULE" ]; then
			echo "Starting $0 with $DEVICE ..."
			loadproc modprobe  $MODULE
		    fi
		    if [ "$MODE" = dynamic ]; then
			echo "Starting dhcpcd on $DEVICE ..."
			if [ -e $DHCPCD_PATH$DEVICE.pid ]; then
			    dhcpcPid=`cat $DHCPCD_PATH$DEVICE.pid`
			    dhcpcd -k $DEVICE 1>/dev/null 2>&1
			    renice 10 $dhcpcPid 1>/dev/null 2>&1 || rm -f $DHCPCD_PATH$DEVICE.pid
			    sleep 1
			fi
			loadproc dhcpcd $DEVICE 
		    elif [ "$MODE" = static ]; then
			echo "Setting up static networking on $DEVICE"
			ifconfig  $DEVICE $IP broadcast $BROADCAST netmask $NETMASK
# check if GATEWAY is set; gateway is set by PPP or other software in some cases
			if [ ! -z "$GATEWAY" ]; then
			    route add default gateway $GATEWAY
			fi
			evaluate_retval
		    else 
			echo " There are errors in $netdevdir/$DEVICE.dev"
		    fi
		fi
	    fi
	done
	;;

    stop)
	for DEVICE in $devices; do
	    if [ -f $netdevdir/$DEVICE.dev ]; then
		unset MODE MODULE IP BROADCAST NETMASK GATEWAY
		. $netdevdir/$DEVICE.dev
		if [ -z "$MODE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE.dev"
		else
		    if [ "$MODE" = dynamic ]; then 
			echo "Stopping dhcpcd on $DEVICE ..."
			dhcpcd -k $DEVICE
			evaluate_retval
			sleep 2
		    else
			ifconfig $DEVICE down
		    fi
# only do this if network device is a module
		    if [ ! -z "$MODULE" ]; then
			echo "Stopping $0 on $DEVICE ..."
			modprobe -r $MODULE
			evaluate_retval
		    fi
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
	    . $netdevdir/$DEVICE.dev
		if [ -z "$MODE" ]; then
		    echo " There are errors in $netdevdir/$DEVICE.dev"
		else
		    if [ "$MODE" = dynamic ]; then
			statusproc dhcpcd
		    fi
		    ifconfig $DEVICE
		fi
	done
	;;

    *)
	echo "Usage: $0 {start|stop|restart|status} [DEVICE]"
	exit 1
	;;
esac
