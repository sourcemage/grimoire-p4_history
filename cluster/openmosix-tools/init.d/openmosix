#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:3 4 5:S50
# SMGL-STOP:0 1 2 6:K50

. /etc/init.d/functions


start() {

  echo     -n "Enabling OpenMosix... "
  /sbin/setpe -W $a1 $a2 -f /etc/openmosix.map
  echo     "done."

}


stop() {

  echo     -n "Disabling OpenMosix... "
  echo 0 > /proc/hpc/admin/mospe
  echo     "done."

}

case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac
