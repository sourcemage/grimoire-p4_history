#!/bin/sh

case  $1  in
  start|restart)  echo  "$1ing oidentd."
                  pkill  "^oidentd$"  &&  sleep 5
                  oidentd  -u daemon  -g daemon
                  ;;
           stop)  echo  "$ping oidentd."
                  pkill  "^oidentd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
