#!/bin/sh
#
# SMGL-script-version=20030527
# SMGL-START:S 3 4 5:S40
# SMGL-STOP:0 1 2 6:K60

source /etc/init.d/functions

case $1 in
  start)
    echo 'Starting Jabber Daemon...'
    /usr/bin/jabberd -D &
    evaluate_retval
    ;;
  stop)
    echo 'Stopping Jabber Daemon - C2S...'      && killproc c2s
    echo 'Stopping Jabber Daemon - SM...'       && killproc sm
    echo 'Stopping Jabber Daemon - Resolver...' && killproc resolver
    echo 'Stopping Jabber Daemon - Router...'   && killproc router
    ;;
  restart)
    $0 stop
    /usr/bin/sleep 1
    $0 start
    ;;
  status)
    statusproc router
    statusproc resolver
    statusproc sm
    statusproc c2s
    ;;
  *)
    echo 'Jabber Daemon control script $Revision$'
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac
