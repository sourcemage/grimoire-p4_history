#!/bin/bash
# irda.sh takes care of starting and stopping IrDA support
#
# SMGL-script-version=20021030
# set the above to custom instead of date format if you use
# a custom script
# this sets the run levels and priority for links
# SMGL-START:3 4 5:S44
# SMGL-STOP:0 1 2 6:K56
#

# Source function library.
. /etc/init.d/functions

# Source IrDA networking configuration.
. /etc/sysconfig/irda

# Check that irda is up.
[ ${IRDA} = "no" ] && exit 0

[ -f /usr/sbin/irattach ] || exit 0

ARGS=
if [ $DONGLE ]; then
	ARGS="$ARGS -d $DONGLE"
fi
if [ "$DISCOVERY" = "yes" ];then
	ARGS="$ARGS -s"
fi

# See how we were called.
case "$1" in
  start)
        # Attach irda device 
        echo "Starting IrDA: "
        /usr/sbin/irattach ${DEVICE} ${ARGS}
	evaluate_retval
#	touch /var/lock/subsys/irda
# SMGL uses a tmpfs /var/lock, this is safer
	if [ ! -d /var/lock/subsys ]; then
	    mkdir /var/lock/subsys
	    touch /var/lock/subsys/irda
	elif [ ! -f /var/lock/subsys/irda ]; then
	    touch /var/lock/subsys/irda
	fi
        echo
        ;;
  stop)
        # Stop service.
        echo "Shutting down IrDA: "
	killproc irattach
	rm -f /var/lock/subsys/irda
        echo
        ;;
  status)
	status irattach
	;;
  restart|reload)
	$0 stop
	$0 start
	;;
  *)
        gprintf "Usage: irda {start|stop|restart|reload|status}\n"
        exit 1
esac

exit 0

