#!/bin/sh
#
#  gdm.sh  Load the GDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)gdm.sh  1.0.0  2002-10-02  Eric Sandall <eric@sandall.us>
#
source /etc/init.d/functions

case  $1  in
          start)
		  		echo "$1ing gdm"
				loadproc gdm
				;;
				
           stop)
		   		echo "$1ping gdm"
				killproc gdm
				;;

        restart)
				stop   $0  &&
                start  $0
                ;;

		status)
				statusproc gdm
				;;

              *)
			  	echo "Usage: $0 {start|stop|restart}"
				exit 1
                ;;
esac
