(
  patch -p0 < $SCRIPT_DIRECTORY/procps.patch                  &&
  patch -p1 < $SCRIPT_DIRECTORY/01-01-procps-2.0.7-intl.patch &&

  make                                &&
  prepare_install                     &&
  make  -e XSCPT='' DESTDIR= install  &&
  mv  /usr/bin/kill /bin

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/sysctl.sh  /etc/init.d
  ln  -sf     ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl

)
