#!/bin/sh
#
#  mountnfs.sh  Mounts smbfs,ncpfs, and nfs filesystems defined in /etc/fstab
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)mountnfs.sh  1.0.0  2002-05-04  Eric Sandall <eric@sandall.us>
#

start() {

  echo  -n  "Mounting remote filesystems..."
  mount    -a -F -t nfs,ncpfs,smbfs
  echo     "done."

}


stop() {

  echo     -n "Unmounting remote filesystems... "
  umount   -a -f -r -t smbfs,nfs,ncpfs
  echo     "done."

}

case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac
