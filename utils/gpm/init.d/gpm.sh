#!/bin/sh
#
#  gpm.sh 
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)gpm.sh  1
#
# SMGL-script-version=20030424
# SMGL-START:1 2 3 4 5:S45
# SMGL-STOP:0 6:K40
#

source /etc/init.d/functions

MOUSECFG=/etc/sysconfig/mouse

. $MOUSECFG

case  $1  in
          start)
		  		echo "$1ing gpm"
                loadproc  gpm -t $MOUSE -m $DEV
				;;

           stop)
		   		echo "$1ping gpm"
                killproc  gpm
                ;;

        restart)
				echo "Reloading gpm"
		killproc  gpm 
                loadproc  gpm -t $MOUSE -m $DEV
                ;;

		status)
				statusproc  gpm
				;;
				
              *)
			  	echo "Usage: $0 {start|stop|restart}"
				exit 1
                ;;
esac
