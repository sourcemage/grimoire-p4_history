#!/bin/sh
#
#  mountnfs.sh  Mounts smbfs,ncpfs, and nfs filesystems defined in /etc/fstab
#
#               Written for Source Mage GNU/Linux
#
#  Version:  @(#)mountnfs.sh  1.0.0  2002-05-04  Eric Sandall <eric@sandall.us>
#
# SGL-script-version=20021024
# Need to start after and stop before networking.sh
# SGL-START:3 4 5:S35
# SGL-STOP:0 1 2 6:K65

. /etc/init.d/functions

start() {

  echo  "Mounting remote filesystems..."
  mount    -a -F -t nfs,ncpfs,smbfs
  evaluate_retval

}


stop() {

  echo  "Unmounting remote filesystems... "
  umount   -a -f -r -t smbfs,nfs,ncpfs
  evaluate_retval

}

case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac
