#!/bin/sh

# SMGL-script-version=20030705
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

. /etc/init.d/functions
case $1 in
    start) echo 'Starting SFS client daemon...'
           loadproc sfscd
           ;;
  restart) echo 'Restarting SFS client daemon...'
           reloadproc sfscd
           ;;

     stop) echo 'Stopping SFS client daemon...'
           killproc sfscd
           ;;

        *) echo "Usage: $0 {start|stop|restart}"
           exit 1
           ;;
esac
