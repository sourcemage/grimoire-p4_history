#!/bin/sh

case  $1  in
  start|restart)  echo "$1ing apmd"
                  pkill  "^apmd$"  &&  sleep  5
                  apmd -P /etc/apmd_proxy
                  ;;

           stop)  echo "$1ping apmd"
                  pkill  "^apmd$"
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
                  ;;
esac
