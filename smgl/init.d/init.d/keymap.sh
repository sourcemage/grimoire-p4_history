#!/bin/bash

RUNLEVEL=S
NEEDS="+local_fs"

. /etc/init.d/smgl_init
. /etc/sysconfig/keymap

case $1 in
  start)    required_executable /bin/loadkeys

            /bin/loadkeys $KEYMAP
            evaluate_retval

            if [ "$ENABLE_EURO" = "yes" ] ; then
              /bin/loadkeys euro.inc
              evaluate_retval
            fi

            if [ "$CONSOLECHARS_ARGS" ] ; then
              required_executable /usr/bin/consolechars

              echo "Setting console settings..."
              /usr/bin/consolechars $CONSOLECHARS_ARGS
              evaluate_retval
            fi
            ;;

  stop)     ;;

  *)        echo "Usage: $0 {start|stop}"
            exit 1
            ;;
esac
