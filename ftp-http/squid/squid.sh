#!/bin/sh

case "$1" in
  start|reload)
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
