#!/bin/bash
#
# SGL-script-version=20021116
# SGL-START:S:S15
# SGL-STOP:0 6:K75

. /etc/init.d/functions

case $1 in 
    start)
	echo "Setting System Time using the Hardware Clock."
	/sbin/hwclock  --hctosys  --localtime
	evaluate_retval
	;;
    stop)
	echo "Setting the Hardware Clock to the current System Time."
	/sbin/hwclock --systohc --localtime
	evaluate_retval
	;;
    adjust)
	echo "Adjusting the Hardware Clock to account for drift."
	/sbin/hwclock --adjust
	evaluate_retval
	;;
    show)
	echo "Show Hardware Clock time."
	/sbin/hwclock --show
	;;
    *)
	echo "Usage: $0 {start|stop|adjust|show}"
	exit 1
	;;
esac
