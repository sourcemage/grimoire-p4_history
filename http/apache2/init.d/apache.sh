#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:S 3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

source /etc/init.d/functions

case $1 in
	  start)
			echo "$1ing Apache web server"
			apachectl $1
			#	apachectl startssl
			evaluate_retval
			;;
			
  	restart)
			echo "$1ing Apache web server."
			if [ -f /var/run/httpd.pid ]; then
				apachectl $1
				evaluate_retval
			else
				$0 start
			fi
			;;
			
	   stop)
			echo "$1ping Apache web server."
			apachectl $1
			evaluate_retval
			;;
			
	      *)
			echo "Usage: $0 {start|stop|restart}"
			exit 1
			;;
esac
