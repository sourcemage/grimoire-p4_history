#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10
#

case  $1  in
  start|restart)  echo   "$1ing ntop, a network traffic usage monitor."
                  pkill  "^ntop$"
                  ntop   -d
                  ;;
           stop)  echo   "$1ing ntop."
                  pkill  "^ntop$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
