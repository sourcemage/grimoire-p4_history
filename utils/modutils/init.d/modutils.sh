#!/bin/sh

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
