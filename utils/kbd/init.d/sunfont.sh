#!/bin/sh

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
