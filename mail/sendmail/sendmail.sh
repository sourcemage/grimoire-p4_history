#!/bin/sh

case $1 in
   start)  echo     "$1ing sendmail MTA."
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
           sendmail -bd -q30m
           pid=`pidof sendmail`
           if [ -n "$pid" ]; then
             echo "$pid" > /var/run/sendmail.pid
           else
             echo "sendmail startup failed."
           fi
           ;;

    stop)  echo     "$1ing sendmail."
           pid=`pidof sendmail`
           if [ -n "$pid" ]; then
             kill SIGTERM `pidof sendmail` 
           else
             echo "sendmail is not running."
           fi
           rm -f /var/run/sendmail.pid
           ;;

 restart)
	   $0 stop
	   sleep 1
	   $0 start
           ;;  

       *)  echo     "Usage: $0 {start|stop|restart}"
           ;;
esac
