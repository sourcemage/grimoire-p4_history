#!/bin/sh
#
# Preliminary samba.sh for using samba.
# Written by Jeremy Kolb
# Start or stop the samba server based upon the first argument to the script.
#

source /etc/init.d/functions

case $1 in
        start)
                echo "Starting Samba Server..."
                loadproc /usr/sbin/smbd -D
                ;;

        stop)
                echo "Stopping Samba Server..."
                killproc /usr/sbin/smbd
                ;;

        restart)
	        echo "Restarting Samba Server..."
                $0 stop
                /usr/bin/sleep 1
                $0 start
                ;;

        status)
	        statusproc smbd
		;;

        *)
                echo "Usage: $0 {start|stop|restart|status}"
                exit 1
                ;;
esac
# end of the samba startup script
