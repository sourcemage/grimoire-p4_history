#!/bin/sh

# SMGL-script-version=20030225
# SMGL-START:3 4 5:S95
# SMGL-STOP:0 1 2 6:K05

source /etc/init.d/functions

case  $1  in
  start)    echo "Starting oidentd."
            loadproc oidentd  -u daemon  -g daemon
            ;;

  restart)  $0 stop
            $0 start
            ;;

  stop)     echo  "Stopping oidentd."
            killproc oidentd
            ;;

  status)   statusproc oidentd
            ;;

  *)        echo   "Usage: $0 {start|stop|restart|status}"
            ;;
esac
