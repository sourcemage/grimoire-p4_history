#!/bin/sh
#
#  wdm.sh  Load the WDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)wdm.sh  1.0.0  2003-03-28  Eric Sandall <eric@sandall.us>
#

case  $1  in
          start)  echo "$1ing wdm"
                  wdm
                  ;;

           stop)  echo "$1ping wdm"
                  pkill  "^wdm*"
                  ;;

        restart)  stop   $0  &&
                  start  $0
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
