#!/bin/sh

case $1 in
     start|restart|stop)  echo      "$1ing Apache web server."
                          mkdir  -p  /var/run/httpd
                          apachectl  $1
                          ;;
                      *)  echo      "Usage: $0 {start|stop|restart}"
                          ;;
esac
