#!/bin/bash

# SMGL-script-version=20030311
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

READABLE_TIMESTAMPS=1   # If set to 0 then UNIX timestamps are used.
LOGFILE="/var/log/maradns"

source /etc/init.d/functions

# Can't use loadproc because of the startup process MaraDNS uses...
function start_maradns()
{

  getpids maradns

  if [ -z "$pidlist" ] ; then
    # Actual startup of MaraDNS
    if [ $READABLE_TIMESTAMPS -ne 0 ]
    then nohup maradns | awk '{ sub(/^Timestamp: ([0-9]+)/,
      strftime("%c", $2)) } { print; fflush() }' >> $LOGFILE &
    else nohup maradns >> $LOGFILE &
    fi

    sleep 1

    # Check if the process is still running to determine
    # whether MaraDNS started successfully...
    getpids maradns
    [ -n "$pidlist" ] && true || false
    evaluate_retval
  else
    $SET_WCOL
    print_status warning running
  fi

}

case "$1" in
  start)    echo  "Starting MaraDNS..."
            start_maradns
            ;;
  restart)  $0 stop
            sleep 1
            $0 start
            ;;
  stop)     echo  "Stopping MaraDNS..."
            killproc maradns
            ;;
  status)   statusproc maradns
            ;;
  *)        echo  "Usage: $0 {start|stop|restart|status}"
            exit 1
            ;;
esac
