#!/bin/sh

source /etc/init.d/functions

case $1 in
 
  start)  
	echo     "Starting syslog-ng daemon ..."
	loadproc syslog-ng
	;;

  stop) 
	echo     "Stoping syslog-ng daemon ..."
	killproc syslog-ng
	;;                 
		  
  restart)
	echo "Restarting syslog-ng daemon ..."
	$0 stop
	/usr/bin/sleep 1
	$0 start
	;;

  *)    
        echo     "Usage: $0 {start|stop|restart}"
	;;
	                                        
esac
