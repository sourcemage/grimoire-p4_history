#!/bin/bash
# description: sensors is used for monitoring motherboard sensor values.
# See also the lm_sensors homepage at:
#     http://www2.lm-sensors.nu/~lm78/index.html
# This uses /etc/sysconfig/sensors that contains the modules to
# be loaded/unloaded. /etc/sysconfig/sensors is written by sensors-detect.
# /etc/modules.conf also needs to be updated before using this script.

source /etc/init.d/functions

CONFIG=/etc/sysconfig/lm_sensors
MODULES=`grep \^MODULE_ $CONFIG | cut -d= -f2`

case "$1" in
    start)
	for i in $MODULES; do
              echo "Starting hardware sensor $i ..."
	      modprobe $i &>/dev/null
              evaluate_retval
    done
             echo "Starting sensors ..."
             loadproc /usr/bin/sensors -s
    ;;
    stop)
    for i in $MODULES; do
	echo "Stopping hardware sensor $i ..."
	modprobe -r $i &>/dev/null
	evaluate_retval
    done
    ;;
    restart)
        $0 stop
        sleep 1
        $0 start
    ;;
    status)
        /usr/bin/sensors
	;;

    *)
		echo "Usage: $0 {start|stop|restart|status}"
		exit 1    
  
esac

