#!/bin/sh

case $1 in
     start|restart  )  echo      "$1ing pglogd - Apache web server logger."
                      mkdir  -p  /var/log/pglogd
		      pkill  "^pglogd$"
                      pglogd -c /etc/pglogd.conf
                      ;;

     stop 	    )  echo      "$1ing pglogd - Apache web server logger."
		      pkill  "^pglogd$"
                      ;;

                  *)  echo      "Usage: $0 {start|stop|restart}"
                      ;;
esac
