#!/bin/sh
#
#  kdm.sh  Load the GDM login manager at boot
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)kdm.sh  1.0.0  2002-10-02  Eric Sandall <eric@sandall.us>
#  Version:  @(#)kdm.sh  1.0.1  2003-03-28  Eric Sandall <eric@sandall.us>
#    Now properly kills all instances of kdm (since they are not just named kdm)
#

case  $1  in
          start)  echo "$1ing kdm"
                  kdm
                  ;;

           stop)  echo "$1ping kdm"
                  pkill  "^kdm*"
                  ;;

        restart)  stop   $0  &&
                  start  $0
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
