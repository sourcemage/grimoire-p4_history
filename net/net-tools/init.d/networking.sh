#!/bin/bash
# /etc/init.d/networking.sh
# SMGL-script-version=20030727
# set the above to custom instead of date format if you use
# a custom networking script
# this sets the run levels and priority for links
# SMGL-START:3 4 5:S30
# SMGL-STOP:0 1 2 6:K70
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

# this provides you with the ability to start/stop/check status on 
# one or more cards if you so desire.

if [ $# -le 1 ]; then
    devices=$(ls $netdevdir | grep dev$ | cut -d. -f1)
else
    devices=$(echo $@ | sed s/$1//)
fi

case "$1" in
  start)
    for DEVICE in $devices; do
      /sbin/ifup $DEVICE
      evaluate_retval
    done
    ;;

  stop)
    for DEVICE in $devices; do
      /sbin/ifdown $DEVICE
      evaluate_retval
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
    echo "Usage: $0 {start|stop|restart|status} [DEVICE...]"
    exit 1
    ;;
esac
