#!/bin/sh
# $Id: apache.sh,v 1.2 2003/01/08 19:22:53 sergeyli Exp $

case $1 in
start)
	echo "$1ing Apache web server"
	apachectl $1
#	apachectl startssl
	;;
restart)
	echo "$1ing Apache web server."
	if [ -f /var/run/httpd.pid ]; then
		apachectl $1
	else
		$0 start
	fi
	;;
stop)
	echo "$1ping Apache web server."
	apachectl $1
	;;
*)
	echo "Usage: $0 {start|stop|restart}"
	;;
esac
