#!/bin/sh
#
# SMGL-script-version=20030224
# SMGL-START:1 2 3 4 5:S25
# SMGL-STOP:0 6:K75

source /etc/init.d/functions


case  $1  in
          start)  echo "$1ing apmd"
                  loadproc apmd -P /etc/apmd_proxy
                  ;;
        restart)  echo "retstarting apmd"
				  reloadproc apmd
				  ;;
           stop)  echo "$1ping apmd"
                  killproc  apmd
                  ;;

              *)  echo "Usage: $0 {start|stop|restart}"
			      exit 1
                  ;;
esac
