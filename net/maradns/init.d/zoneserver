#!/bin/bash

# SMGL-script-version=20030311
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

source /etc/init.d/functions

function start_zoneserver()
{

  getpids zoneserver

  if [ -z "$pidlist" ] ; then
    nohup zoneserver > /dev/null &

    sleep 1

    getpids zoneserver
    [ -n "$pidlist" ] && true || false
    evaluate_retval
  else
    $SET_WCOL
    print_status warning running
  fi

}

case "$1" in
  start)    echo  "Starting MaraDNS zoneserver..."
            start_zoneserver
            ;;
  restart)  $0 stop
            sleep 2
            $0 start
            ;;
  stop)     echo  "Stopping MaraDNS zoneserver..."
            killproc zoneserver
            ;;
  status)   statusproc zoneserver
            ;;
  *)        echo  "Usage: $0 {start|stop|restart|status}"
            exit 1
            ;;
esac
