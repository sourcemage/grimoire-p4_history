(

  patch -p1 < $SCRIPT_DIRECTORY/gSculpt-0.3-gcc3.patch
  make                       &&
  prepare_install            &&
  cp  bin/gsculpt  /usr/bin

) > $C_FIFO 2>&1
