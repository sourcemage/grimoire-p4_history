#!/bin/bash

RUNLEVEL=S
NEEDS="+local_fs"

. /etc/init.d/smgl_init
. /etc/sysconfig/hwclock

                      tz_arg="--localtime"
[ "$UTC" = "yes" ] && tz_arg="--utc"

test -x /sbin/hwclock || exit 5

case $1 in 
  start)  echo "Setting System Time using the Hardware Clock..."
          /sbin/hwclock --hctosys $tz_arg
          evaluate_retval
          ;;

  stop)   echo "Setting the Hardware Clock to the current System Time..."
          /sbin/hwclock --systohc $tz_arg
          evaluate_retval
          ;;

  adjust) echo "Adjusting the Hardware Clock to account for drift..."
          /sbin/hwclock --adjust
          evaluate_retval
          ;;

  show)   echo "Show Hardware Clock time."
          /sbin/hwclock --show
          ;;

  *)      echo "Usage: $0 {start|stop|adjust|show}"
          exit 1
          ;;
esac
