#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 6:K10
#

CTL=/usr/bin/pg_ctl
USER=postgres
DBPATH=/var/lib/postgres
LOGFILE=/var/log/postgres


case "$1" in
    start)
        echo "starting postmaster"
        su $USER -c "$CTL -D $DBPATH -l $LOGFILE start"
    ;;

    stop)
        echo "stopping postmaster"
        su $USER -c "$CTL -D $DBPATH -l $LOGFILE -m fast stop"
    ;;

    restart)
        $0 stop
        $0 start
    ;;

    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
    ;;
esac
