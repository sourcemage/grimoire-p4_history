#!/bin/sh

# SMGL-script-version=20030705
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

. /etc/init.d/functions

case $1 in
    start) echo 'Starting SFS server daemon...'
           loadproc sfssd
           ;;
  restart) echo 'Restarting SFS server daemon...'
           reloadproc sfssd
           ;;

     stop) echo 'Stopping SFS server daemon...'
           killproc sfssd
           ;;

        *) echo "Usage: $0 {start|stop|restart}"
           exit 1
           ;;
esac
