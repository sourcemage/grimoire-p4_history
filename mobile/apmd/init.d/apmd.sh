#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:1 2 3 4 5:S25
# SMGL-STOP:0 6:K75

source /etc/init.d/functions


case  $1  in
          start)  echo  "$1ing APM Daemon..."
                  loadproc apmd -P /etc/apmd_proxy
                  ;;
           stop)  echo  "$1ping APM Daemon..."
                  killproc  apmd
                  ;;
        restart)  echo  "retstarting APM Daemon..."
				  reloadproc apmd
				  ;;
		 status)  statusproc apmd
				  ;;
              *)  echo "Usage: $0 {start|stop|restart}"
			      exit 1
                  ;;
esac
