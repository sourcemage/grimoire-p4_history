#!/bin/sh
#
# SMGL-script-version=20030708
# SMGL-START:3 4 5:S35
# SMGL-STOP:0 1 2 6:K70
#
# Written by Eric Sandall for Source Mage GNU/Linux
#                             (http://www.sourcemage.org)
# v1.0.0  2003-07-08  Initial version created for my server at home
#

# Device which you want the DHCP server to listen on
# Leave blank if you want to listen on all devices
DEVICE=eth1

if  [  !  -f  /var/state/dhcp/dhcpd.leases  ];  then
  touch  /var/state/dhcp/dhcpd.leases
fi

case $1 in
  start)  echo             "$1ting dhcpd..."
          /usr/sbin/dhcpd  $DEVICE                         &&
          /bin/pidof  /usr/sbin/dhcpd  >  /var/run/dhcpd.pid
          ;;
   stop)  echo  "$ping dhcpd..."
          kill  `cat /var/run/dhcpd.pid`  &&
          rm    /var/run/dhcpd.pid
          ;;
restart)  $0 stop
          $0 start
          ;;
      *)  echo  "Usage:  $0  {start|stop|restart}"
esac
