#!/bin/sh
source /etc/init.d/functions

case  $1  in
          start)  echo "Starting Internet superserver, xinetd."
                  loadproc xinetd -reuse
                  ;;
        restart)  echo "Restarting Internet superserver, xinetd."
	          reloadproc xinetd
		  ;;
           stop)  echo   "Stopping xinetd."
                  killproc xinetd
                  ;;
         status)  statusproc xinetd
	          ;;
              *)  echo   "Usage: $0 {start|stop|restart|status}"
	          exit 1
                  ;;
esac
