#!/bin/sh
# mosstatd     This shell script takes care of starting and stopping \
#              the mosstatd daemon.

[ -x /usr/bin/mosstatd ] || exit 0

start () {
    echo -n $"Starting mosstatd: "
    /usr/bin/mosstatd
}

stop () {
    # stop daemon
    echo -n $"Stopping mosstatd: "
    /usr/bin/mosstatd -k
    # to be sure...
    killall /usr/bin/mosstatd >/dev/null 2>&1
    /bin/rm -f /var/run/mosstatd.pid >/dev/null 2>&1
}

restart () {
    stop
    start
}

# See how we were called.
case "$1" in
    start)
	start
	;;
    stop)
	stop
	;;
    status)
	if [ -f /var/run/mosstatd.pid ]; then
	 echo "The mosstatd daemon is running with PID `cat /var/run/mosstatd.pid`"	
	 else
	 echo "The mosstatd daemon is not running"
	fi
	;;
    restart)
	restart
	;;
    *)
        echo $"Usage: $0 {start|stop|status}"
esac

