#!/bin/sh

# Edit and uncomment the appropriate lines

DEVICE=
IP=
BROADCAST=
NETMASK=
GATEWAY=
MODULE=

case $1 in
    start)  echo      "$1ing networking."
            # modprobe  $MODULE
            # ifconfig  $DEVICE $IP broadcast $BROADCAST netmask $NETMASK
            # route     add default gateway $GATEWAY
            # dhcpcd    $DEVICE
            ;;
              
     stop)  echo      "$1ping networking."
            # ifconfig  $DEVICE down
            # modprobe  -r  $MODULE
            ;;

  restart)  $0  stop  &&
            $0  start
            ;;

        *)  echo  "Usage: $0 {start|stop|restart}"
            ;;
esac
