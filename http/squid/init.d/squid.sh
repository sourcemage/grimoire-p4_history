#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K25
#

case "$1" in
  start|reload|restart)
    echo  "$1ing squid"
    squid  -k  shutdown  >  /dev/null  2>&1
    squid  -z -F         >  /dev/null  2>&1
    squid  $SQUID_OPTS
    ;;

  stop)
    echo   "$1ping squid"
    squid  -k  shutdown
    ;;

  *)
    echo  "Usage: $0 {start|stop|reload|restart}"
    exit  1
esac
