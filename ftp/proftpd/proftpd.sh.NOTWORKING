#!/bin/sh

case $1 in
     start|restart|stop)  echo      "$1ing ProFTPd FTP server."
                          proftpd
                          ;;
                      *)  echo      "Usage: $0 {start|stop|restart}"
                          ;;
esac
