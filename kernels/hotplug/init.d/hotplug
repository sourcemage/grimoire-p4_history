#!/bin/sh
#
# hotplug This scripts starts hotpluggable subsystems.
#
# chkconfig: 2345 01 99
# description:	Starts and stops each hotpluggable subsystem. \
#		On startup, may simulate hotplug events for devices \
#		that were present at boot time, before filesystems \
#		(or other resources) used by hotplug agents were available.
#
# $Id: hotplug,v 1.3 2002/12/03 02:01:48 dbrownell Exp $
#
# Modified for Source Mage GNU/Linux (http://www.sandall.us)
# 2003-07-10  Eric Sandall <eric@sandall.us>
#
# SMGL-script-version=20030710
#
# SMGL-START:1 2 3 4 S:S11
# SMGL-STOP:0 6:K89
#

PATH=/sbin:/bin:/usr/sbin:/usr/bin

# source function library
. /etc/init.d/functions

# Bug #1702
[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys

case "$1" in
    start|restart|status)
	for RC in /etc/hotplug/*.rc
	do
	    $RC $1
	done
	touch /var/lock/subsys/hotplug
	;;
    stop)
	for RC in /etc/hotplug/*.rc
        do
            $RC stop
        done
        rm -f /var/lock/subsys/hotplug
        ;;
    force-reload)
	for RC in /etc/hotplug/*.rc
        do
            $RC stop
        done
	for RC in /etc/hotplug/*.rc
        do
            $RC start
        done
        rm -f /var/lock/subsys/hotplug
        ;;

    *)
	echo $"Usage: $0 {start|stop|restart|status|force_reload}"
	exit 3
	;;
esac
