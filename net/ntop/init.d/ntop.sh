#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030507
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
#
# v20030507  Eric Sandall <eric@sandall.us>  Added multiple interface reporting
#

source /etc/init.d/functions
. /etc/sysconfig/ntop

if  [  -d  /etc/sysconfig/network  ] ; then
  for i in /etc/sysconfig/network/*.dev ; do
    i=$( basename ${i%.dev} )
    [ "$i" = "lo" -a "$IGNORE_LO" = "yes" ] && continue
    IFACES="${IFACES},$i"
  done
  IFACES="${IFACES#,}"    # Remove comma from beginning of list
fi

case  $1  in
  start)    echo "Configuring ntop for the following interfaces: \"${IFACES}\""
            loadproc ntop -d -u nobody -w $HTTP_PORT -W $HTTPS_PORT \
                  --use-syslog=daemon -i ${IFACES} -M
            ;;

  restart)  $0 stop
            $0 start
            ;;

  stop)     echo "Stopping ntop..."
            killproc ntop
            ;;

  status)   statusproc ntop
            ;;

  *)        echo "Usage: $0 {start|stop|restart|status}"
            ;;
esac
