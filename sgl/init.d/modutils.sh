#!/bin/sh
source /etc/init.d/functions

if  [  -x  /sbin/depmod  ];  then

  echo    -n  "depmod -a ... "
  depmod  -a
  evaluate_retval
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
#    evaluate_retval
  done
  evaluate_retval
fi
