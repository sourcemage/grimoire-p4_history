#!/bin/sh

source /etc/init.d/functions

case $1 in
  start)    echo "Starting portmap."
            loadproc portmap
            ;;

  restart)  $0 stop
            $0 start
            ;;

  stop)     echo "Stopping portmap."
            killproc portmap
            ;;

  status)   statusproc portmap
            ;;

  *)        echo  "Usage: $0 {start|stop|restart|status}"
            ;;
esac
