#!/bin/sh

source /etc/init.d/functions

case $1 in
  start)
    echo 'Starting SASL Authentication Daemon...'
    #
    # See `man 8 saslauthd` for the complete list of all authentication
    # methods supported by saslauthd. Some of them have to be enabled
    # at compile time, like LDAP.
    #
    loadproc /usr/sbin/saslauthd -a pam
    ;;
  stop)
    echo 'Stopping SASL Authentication Daemon...'
    killproc saslauthd
    ;;
  reload)
    echo 'Reloading SASL Authentication Daemon...'
    reloadproc /usr/sbin/saslauthd
    ;;
  restart)
    $0 stop
    /usr/bin/sleep 1
    $0 start
    ;;
  status)
    statusproc saslauthd
    ;;
  *)
    echo 'SASL Authentication Daemon control script revision $Revision$'
    echo "Usage: $0 {start|stop|reload|restart|status}"
    exit 1
    ;;
esac
