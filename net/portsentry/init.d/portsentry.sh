#!/bin/bash
#
# portsentry Start the portsentry Port Scan Detector 
#
# Authors: Craig Rowland <crowland@psionic.com> and Tim Powers <timp@redhat.com>
# Modified Feb 01, 2001: Vincent Danen <vdanen@mandrakesoft.com>
#
# chkconfig: 345 98 05
# description: PortSentry Port Scan Detector is part of the Abacus Project \
#              suite of tools. The Abacus Project is an initiative to release \
#              low-maintenance, generic, and reliable host based intrusion \
#              detection software to the Internet community.
# processname: portsentry
# configfile: /etc/portsentry/portsentry.conf
# pidfile: /var/run/portsentry.pid

# Source function library.
# . /etc/rc.d/init.d/functions

# Source networking configuration.
# . /etc/sysconfig/network

# Check that networking is up.
# [ ${NETWORKING} = "no" ] && exit 0

RETVAL=$?

start (){
  #set up the ignore file
  SENTRYDIR=/etc/portsentry
  TMPFILE=/tmp/portsentry.ignore.tmp

  for i in `/sbin/ifconfig -a | grep inet | awk '{print $2}' | sed 's/addr://'` ; do
    echo $i >> $TMPFILE
  done

  if [ -f $SENTRYDIR/always_ignore ]; then
    cat $SENTRYDIR/always_ignore >> $TMPFILE
  fi
  cp -f $TMPFILE $SENTRYDIR/portsentry.ignore
  rm -f $TMPFILE
  
  #check for modes defined in the config file
  if [ -s $SENTRYDIR/portsentry.modes ] ; then
    modes=`cut -d "#" -f 1 $SENTRYDIR/portsentry.modes`
  else
    modes="tcp udp"
  fi
  for i in $modes ; do
    echo  "starting portsentry -$i. " 
	/usr/sbin/portsentry -$i
    RETVAL=$?
  done
  [ $RETVAL -eq 0 ] && touch /var/lock/portsentry
  echo
  return $RETVAL
}

stop() {
  #stop daemon
  echo -n "stopping portsentry. "
  pkill portsentry
  RETVAL=$?
  [ $RETVAL -eq 0 ] && rm -f /var/lock/portsentry
  echo
  return $RETVAL
}

restart() {
  stop
  start
}

case $1 in 
  start)
    start
  ;;
	
  stop)
    stop
  ;;
	
  restart|reload)
    stop
    start
  ;;
	
  condrestart)
    [ -f /var/lock/portsentry ] && restart || :
  ;;

  status)
    status portsentry
  ;;
  *)
    echo "Usage: portsentry {start|stop|restart|reload|condrestart|status}"
    exit 1
esac
