#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:2 3 4 5:S40
# SMGL-STOP:0 1 6:K60
#

source /etc/init.d/functions

BIN_PATH=/usr/bin
CFG_FILE=/etc/snort/snort.conf
IFACE=eth0
OPTIONS="-D"

case $1 in

    start)  
	echo  "Starting Snort, Intrusion Detection System."
	loadproc  ${BIN_PATH}/snort -c ${CFG_FILE} -i ${IFACE} -u snort -g snort ${OPTIONS}     
	;;
	
     stop)  
	echo  "Stoping  Snort, Intrusion Detection System."
	killproc snort  
	;;
	
 restart)                                                                                              
	echo  "Restarting snort"
	$0 stop
	/usr/bin/sleep 1
	$0 start
	;;
	
    test)
	echo  "Testing snort ruleset files"
	${BIN_PATH}/snort -T -c ${CFG_FILE}
	evaluate_retval
	;;

       *)
        echo  "Usage: $0 {start|stop|restart|test}"
        ;;

esac
