#!/bin/sh
#
#  xdm.sh  Load the XDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)xdm.sh  1.0.0  2002-10-02  Eric Sandall <eric@sandall.us>
#

case  $1  in
          start)  echo "$1ing xdm"
                  xdm
                  ;;

           stop)  echo "$1ping xdm"
                  pkill  "^xdm$"
                  ;;

        restart)  stop   $0  &&
                  start  $0
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
