#!/bin/sh

start() {

  [  !  -d  /devices  ]  ||  mount   -n  -t  devfs devfs /devices

  mount   -n  -o  remount,ro  /

  echo    -n "Activating swap... "
  swapon  -a 2> /dev/null
  echo    "done."

  if  [ ! -e /fastboot ]; then 

    [ -e /forcefsck    ]  &&  FORCE="-f"
    [ "$FSCKFIX" = yes ]  &&  FIX="-y"  ||  FIX="-a"

    echo  -n "Checking file systems... "
    fsck  -C -A $FIX $FORCE

    if [ $? -gt 1 ];  then
      echo  "fsck failed."
      echo  "Please repair your file system"
      echo  "manually by running /sbin/fsck"
      echo  "without the -a option"
      sulogin
      reboot  -f
    fi
  fi
  echo     "done."
  mount    -n -o remount,rw /
  echo     > /etc/mtab
  mount    -f -o remount,rw /
  mount    -a -F
  rm       -f /fastboot /forcefsck

}


stop() {

  echo     -n "Deactivating swap... "
  swapoff  -a
  echo     "done."

  echo     -n "Unmounting local filesystems... "
  umount   -t nodevfs,noproc -f -a -r
  echo     "done."

  cat  /etc/mtab  |
  while read DEVICE MOUNT REST; do
    mount  -n -o  remount,ro  $MOUNT
  done

  if  !  mount  -n -o remount,ro  /
  then
    echo  "/ failed to remount read only"
    read  -n 1  -t 120  -p  "Do you want to login? (y/n) "  CONFIRM
    echo
    case  $CONFIRM in
      y|Y)  sulogin ;;
    esac
  fi

}

case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac
