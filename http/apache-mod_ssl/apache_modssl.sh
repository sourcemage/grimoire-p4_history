#!/bin/sh

case $1 in
     start         )  echo      "$1ing Apache web server."
                      mkdir  -p  /var/run/httpsd
                      apachectl  $1ssl
                      ;;
     restart|stop  )  echo      "$ing Apache web server."
                      mkdir  -p  /var/run/httpsd
                      apachectl  $1
                      ;;
                  *)  echo      "Usage: $0 {start|stop|restart}"
                      ;;
esac
