#!/bin/bash

RUNLEVEL=S
NEEDS="+local_fs"

. /etc/init.d/smgl_init
. /etc/sysconfig/keymap

case $1 in
  start)    required_executable /bin/loadkeys

            /bin/loadkeys $KEYMAP
            evaluate_retval
            ;;

  stop)     ;;

  *)        echo "Usage: $0 {start|stop}"
            exit 1
            ;;
esac
