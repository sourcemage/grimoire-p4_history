#!/bin/sh
# /etc/init.d/mount.sh
# SGL-script-version=20020923
# this sets the run levels and priority for links
# SGL-START:S:S10
# SGL-STOP:0 6:K90

source /etc/init.d/functions

start() {

  [  !  -d  /devices  ]  ||  mount   -n  -t  devfs devfs /devices
  mount   -n  -o  remount,ro  /
  echo    -n "Activating swap... "
  swapon  -a 2> /dev/null
  evaluate_retval

  if  [ ! -e /fastboot ]; then 

    [ -e /forcefsck    ]  &&  FORCE="-f"
    [ "$FSCKFIX" = yes ]  &&  FIX="-y"  ||  FIX="-a"

    echo  -n "Checking file systems... "
    fsck  -C -A $FIX $FORCE
    evaluate_retval

    if [ $? -gt 1 ];  then
      $WARNING
      echo  "fsck failed."
      echo  "Please repair your file system"
      echo  "manually by running /sbin/fsck"
      echo  "without the -a option"
      $NORMAL
      sulogin
      reboot  -f
    fi
  fi

  mount    -n -o remount,rw /
  echo     > /etc/mtab
  mount    -f -o remount,rw /
  echo "Mounting local filesystems..."
  mount    -a
  evaluate_retval
  rm       -f /fastboot /forcefsck

}


stop() {

  echo      "Deactivating swap... "
  swapoff  -a
  evaluate_retval

  echo      "Unmounting local filesystems... "
  umount   -t nodevfs,noproc -f -a -r
  evaluate_retval

  cat  /etc/mtab  |
  while read DEVICE MOUNT REST; do
    mount  -n -o  remount,ro  $MOUNT
  done

  if  !  mount  -n -o remount,ro  /
  then
    $WARNING
    echo  "/ failed to remount read only"
    read  -n 1  -t 120  -p  "Do you want to login? (y/n) "  CONFIRM
    echo
    $NORMAL
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
