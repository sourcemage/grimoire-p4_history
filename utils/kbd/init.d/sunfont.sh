#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:2 3 4 5:S80
# SMGL-STOP:0 1 6:K75
#

# Edit and uncomment the appropriate lines

case $1 in
    start)  echo      "$1ing Sun Solaris console font."
            setfont sun12x22
            ;;
              
     stop)  echo      "$1ping Sun Solaris console font."
            setfont
            ;;

        *)  echo  "Usage: /usr/sbin/cast {start|stop}"
            ;;
esac
