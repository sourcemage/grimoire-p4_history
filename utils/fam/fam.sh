#!/bin/sh
# /etc/init.d/fam.sh
# SGL-START:1 2 3 5:S99
# SGL-STOP:0 6:K00

source  /etc/init.d/functions

case  $1  in
    start)  echo  "Starting fam..."
            loadproc /usr/bin/fam
            ;;
  restart)  $0 stop
            /usr/bin/sleep 1
            $0 start
            ;;
     stop)  echo  "Stopping fam..."
            killproc fam
            ;;
   status)  statusproc fam
            ;;
        *)  echo  "Usage: $0 {start|stop|restart|status}"
            exit 1
            ;;
esac
