#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:1 2 3 4 5:S35
# SMGL-STOP:0 6:K50

. /etc/init.d/functions


case $1 in

        start)  echo "$1ing sshd."
                loadproc sshd
                ;;

      restart)  echo "$1ing sshd."
                #
                # Below is commented out due to causing
                # the loss of connection when remotely connected
                # and issuing a restart.
                #
                #reloadproc sshd
				if [ -e /var/run/sshd.pid ]; then
                       kill `cat /var/run/sshd.pid`
                       sleep 1
                fi
                loadproc sshd
                ;;

         stop)  echo "$1ping sshd."
                killproc sshd
                ;;

            *)  echo "Usage: $0 {start|stop|restart}"
                exit 1
                ;;
esac
