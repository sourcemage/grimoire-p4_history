#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:3 4 5:S40
# SMGL-STOP:0 1 2 6:K60
#

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
