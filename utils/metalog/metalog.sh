#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing metalog daemons."
                  pkill    "^metalog$"
                  metalog  --daemonize  --synchronous
                  ;;

   stop)          echo     "$1ping metalog daemons."
                  pkill    "^metalog$"
                  ;;                 

      *)          echo     "Usage: $0 {start|stop|restart}"
                  ;;                                        
esac
