#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing powertweak daemon"
                  pkill    "^powertweakd$"
                  powertweakd              
                  ;;

           stop)  echo     "$1ping powertweak daemon"
                  pkill    "^powertweakd$"
                  ;;

              *)  echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
