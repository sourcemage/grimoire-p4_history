#!/bin/sh
# vim:set ts=2 sw=2 et:

PROGRAM=/bin/false
RUNLEVEL=S
PROVIDES=local_fs
ESSENTIAL=yes

. /etc/init.d/smgl_init
. /etc/sysconfig/devices

checkfs()
{
  [ -e /fastboot     ]  &&  return
  [ -e /forcefsck    ]  &&  FORCE="-f"
  [ "$FSCKFIX" = yes ]  &&  FIX="-y"  ||  FIX="-a"

  echo "Checking file systems..."
  fsck -T -C -A $FIX $FORCE
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

  rm -f /fastboot /forcefsck
}

start()
{
  required_executable /bin/mount
  required_executable /sbin/fsck

  if [ "$DEVICES" != "/dev" ] ; then
    echo "Mounting /devices..."
    mount -n  -t  devfs devfs $DEVICES
    evaluate_retval
  fi

  if [ -x "$RUNLEVELS_DIR/%S/devfsd" ] ; then
    need devfsd
  elif [ "$DEVICES" == "/dev" ] ; then
    ln -s /proc/self/fd/0 /dev/stdin &&
    ln -s /proc/self/fd/1 /dev/stdout &&
    ln -s /proc/self/fd/2 /dev/stderr
  fi

  echo "Mounting root file system read only..."
  mount   -n  -o  remount,ro  /
  evaluate_retval

  checkfs

  mount    -n -o remount,rw /
  echo     > /etc/mtab
  mount    -f -o remount,rw /

  if optional_executable /sbin/swapon ; then
    echo -n "Activating swap... "
    swapon -a 2> /dev/null
    evaluate_retval
  fi

  if [[ $DEVICES_COMPAT == "y" && $DEVICES != "/devices" ]] ; then
    [ -e /devices ] && rm -rf /devices
    ln -sf $DEVICES /devices
  fi

  echo "Mounting local filesystems..."
# Fixed so as to not mount networked filesystems yet (no networking)
# mountnfs.sh will take care of this.
  mount    -a  -t  nosmbfs,nonfs,noncpfs
  evaluate_retval
}


# Simpleinit handles umounting and stuff.
stop()
{
  exit 0
}

restart()       { exit 3; }
reload()        { exit 3; }
force_reload()  { exit 3; }
status()        { exit 3; }

usage()
{
  echo "Usage: $0 {start|stop}"
  echo "Warning: Do not run this script manually!"
}
