#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

case  $1 in
  start|restart)  echo   "$1ing Internet Junk Buster."
                  pkill  "^junkbuster$"
                  junkbuster /etc/junkbuster/config &
                  ;;
           stop)  echo   "$1ing IJB"
                  pkill  "^junkbuster$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
