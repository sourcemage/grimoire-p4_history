#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing system and kernel log daemons."
                  pkill    "^syslogd$"
                  pkill    "^klogd$"
                  syslogd  -m 60
                  klogd
                  ;;

           stop)  echo     "$1ping system and kernel log daemons."
                  pkill    "^syslogd$"
                  pkill    "^klogd$"
                  ;;

              *)  echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
