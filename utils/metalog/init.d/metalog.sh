#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:S:S20
# SMGL-STOP:0 6:K70
#

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
