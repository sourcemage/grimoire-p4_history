#!/bin/bash
#
# SMGL-script-version=20030224
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

source /etc/init.d/functions

case $1 in
        start)    echo "Starting ProFTPd FTP server."
                  loadproc proftpd
                  ;;
        restart)  echo "Restarting ProFTPD FTP server."
                  reloadproc proftpd
                  ;;
        stop)     echo "Stopping ProFTPD FTP server."
                  killproc proftpd
                  ;;
        status)   statusproc proftpd
                  ;;
        *)        echo "Usage: $0 {start|stop|restart|status}"
                  exit 1
                  ;;
esac
