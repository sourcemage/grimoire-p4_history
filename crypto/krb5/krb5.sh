#!/bin/sh

case  $1 in
  start)  echo   "$1ing the Kerberos controller"
          /usr/sbin/krb5kdc
          # /usr/sbin/kadmind
          ;;
   stop)  echo   "$1ing the Kerberos controller"
          pkill  "^krb5kdc$"
          pkill  "^kadmind$"
          ;;
      *)  echo   "Usage $0 {start|stop}"
          ;;
esac
