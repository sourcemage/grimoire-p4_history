#!/bin/sh
#
#  xdm.sh  Load the XDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)xdm.sh  1.0.0  2002-10-02  Eric Sandall <eric@sandall.us>
#
source /etc/init.d/functions

case  $1  in
          start)  
		  		echo  "$1ing xdm"
                loadproc  xdm
                ;;

           stop)
		   		echo  "$1ping xdm"
                killproc  xdm
                ;;

        restart)
				echo  "Restarting xdm"
				reloadproc xdm
				;;

              *)
			  	echo "Usage: $0 {start|stop|restart}"
                exit 1
				;;
esac
