#!/bin/sh

case $1 in
          start)  echo     "$1ing postfix MTA."
                  postfix  start
                  ;;
           stop)  echo     "$1ing postfix"
                  postfix  stop
                  ;;
	restart)
		  $0 stop
		  $0 start
		  ;;  
              *)  echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
