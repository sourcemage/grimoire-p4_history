#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

. /etc/init.d/functions

case  $1  in

          start)  echo "$1ing nessusd, the server part of the Nessus Security Scanner"
                  loadproc nessusd -D
                  ;;

        restart)  echo "$1ing nessusd, the server part of the Nessus Security Scanner"
                  reloadproc nessusd
                  ;;

           stop)  echo "$1ing nessusd, the server part of the Nessus Security Scanner"
                  killproc nessusd
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  exit 1
                  ;;
esac
