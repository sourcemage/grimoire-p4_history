#!/bin/sh

case $1 in
     start|restart)  echo      "$1ing ProFTPd FTP server."
                     kill `cat /var/run/proftpd.pid`
                     proftpd
                     ;;
              stop)  echo      "$1ing ProFTPd FTP server."
                     kill `cat /var/run/proftpd.pid`
                     ;;
            reload)  echo      "$1ing ProFTPd FTP server."
                     kill -HUP `cat /var/run/proftpd.pid`
                     ;;
                 *)  echo      "Usage: $0 {start|stop|restart|reload}"
                     ;;
esac
