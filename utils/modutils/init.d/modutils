#!/bin/sh
#
# Source Mage init.d install information
# SMGL-script-version=20030331
# SMGL-START:S:S20
# SMGL-STOP:0 1 2 6:K75
#

if  [  -x  /sbin/depmod  ];  then

  echo    -n  "depmod -a ... "
  depmod  -a
  echo  "done."

fi

if  [  -e  /etc/modules    ]   &&
    [  -x  /sbin/modprobe  ];  then

  echo  "Loading modules."
  ( cat  /etc/modules;  echo ) |
  while  read  MODULE ARGS;  do
    case  $MODULE in
      \#*|"")  continue  ;;
    esac
    modprobe  $MODULE  $ARGS
  done
fi
