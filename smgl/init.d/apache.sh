#!/bin/sh
source /etc/init.d/functions

case "$1" in
     start)               echo "Starting Apache web server."
                          mkdir  -p  /var/run/httpd
                          apachectl  $1
			  evaluate_retval
                          ;;
     restart)             echo "Restarting Apache web server."
                          apachectl graceful
			  evaluate_retval
			  ;;
     status)              apachectl status
                          ;;
     stop)                echo "Stoping Apache web server"
                          apachectl stop
			  evaluate_retval
			  ;;

      *)                  echo "Usage: $0 {start|stop|restart|status}"
                          exit 1
                          ;;
esac
