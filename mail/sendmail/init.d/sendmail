#!/bin/sh

# SMGL-script-version=20030318
# SMGL-START:3 4 5:S90
# SMGL-STOP:0 1 2 6:K10

. /etc/init.d/functions

case $1 in
   start)  echo     "Starting sendmail..."
	   if [ -e /etc/aliases ]; then
	     if [ -e /etc/aliases.db ] &&
	        [ ""`/usr/bin/find /etc/aliases -follow -newer /etc/aliases.db` != "" ]; then
   	            echo "/etc/aliases is modified."
                    echo "You may want to run newaliases, and makemap:"
		    echo "makemap hash /etc/mail/virtualusertable </etc/mail/virtualusertable,"
                    echo "makemap hash /etc/mail/access </etc/mail/access,"
		    echo "makemap hash /etc/domaintable </etc/mail/domaintable,"
                    echo "makemap hash /etc/mailertable </etc/mail/mailertable."
	     fi
           fi
           loadproc sendmail -bd -q30m
           ;;

    stop)  echo     "Stoping sendmail..."
	   killproc sendmail
           ;;

    restart|reload)
	   $0 stop
	   sleep 1
	   $0 start
           ;;  
    status)
           statusproc sendmail
           ;;
       *)  echo     "Usage: $0 {start|stop|restart|reload|status}"
           ;;
esac
