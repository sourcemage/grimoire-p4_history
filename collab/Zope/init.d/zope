#!/bin/sh
#
# SMGL-script-version=20030514
# SMGL-START:3 4 5:S95
# SMGL-STOP:0 1 2 6:K05

source  /etc/init.d/functions

case  $1  in
    start)  umask  077
            reldir=`dirname  $0`
            cwd=`cd  $reldir;  pwd`
            # Zope's event logger is controlled by the "EVENT_LOG_FILE" environment
            # variable.  If you don't have a "EVENT_LOG_FILE" environment variable
            # (or its older alias "STUPID_LOG_FILE") set, Zope will log to the standard
            # output.  For more information on EVENT_LOG_FILE, see doc/ENVIRONMENT.txt.
            ZLOGFILE=$EVENT_LOG_FILE
            if  [  -z  "$ZLOGFILE"  ];  then
              ZLOGFILE=$STUPID_LOG_FILE
            fi
            if  [  -z  "$ZLOGFILE"  ];  then
              EVENT_LOG_FILE=""
              export  EVENT_LOG_FILE
            fi
            exec  /usr/bin/python  /usr/lib/zope/z2.py  -u zope  "$@"
            ;;
     stop)  kill  `cat  /usr/lib/zope/var/Z2.pid`
            ;;
  restart)  $0  stop   &&
            sleep  2   &&
            $0  start
            ;;
        *)  echo  "Usage:  $0 {start|stop|restart}"
            ;;
esac
