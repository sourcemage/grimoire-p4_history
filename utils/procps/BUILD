(

  make                                &&
  prepare_install                     &&
  make  -e XSCPT='' DESTDIR= install  &&
  mv  /usr/bin/kill /bin

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/sysctl.sh  /etc/init.d
  ln  -sf     ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl

)
