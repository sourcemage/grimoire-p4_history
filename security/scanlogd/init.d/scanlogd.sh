#!/bin/sh
#
# SMGL-script-version=20030404
# SMGL-START:2 3 4 5:S40
# SMGL-STOP:0 6:K60

source /etc/init.d/functions

BIN_PATH=/usr/sbin

case $1 in
 
  start)  
	echo  "Starting Scanlogd"
	loadproc  ${BIN_PATH}/scanlogd
	;;

  stop) 
	echo  "Stoping Scanlogd"
	killproc scanlogd
	;;                 
		  
  restart)
	echo  "Restarting Scanlogd"
	$0 stop
	/usr/bin/sleep 1
	$0 start
	;;

  *)    
        echo     "Usage: $0 {start|stop|restart}"
	;;
	                                        
esac
