#!/bin/sh

RUNLEVEL=S
NEEDS="+local_fs"

. /etc/init.d/smgl_init
. /etc/sysconfig/keymap

test -x /usr/bin/loadkeys || exit 5

case $1 in
  start)    /usr/bin/loadkeys $KEYMAP
            evaluate_retval
            ;;

  stop)     ;;

  *)        echo "Usage: $0 {start|stop}"
            exit 1
            ;;
esac
