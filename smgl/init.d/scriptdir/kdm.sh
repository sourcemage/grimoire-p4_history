#!/bin/sh
#
#  kdm.sh  Load the KDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)kdm.sh  1.0.0  2002-10-02  Eric Sandall <eric@sandall.us>
#
source /etc/init.d/functions

case  $1  in
          start)
		  		echo "$1ing kdm"
                loadproc  kdm
				;;

           stop)
		   		echo "$1ping kdm"
                killproc  kdm
                ;;

        restart)
				echo "Reloading kdm"
				reloadproc  kdm
                ;;

		status)
				statusproc  kdm
				;;
				
              *)
			  	echo "Usage: $0 {start|stop|restart}"
				exit 1
                ;;
esac
