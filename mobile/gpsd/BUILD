(
  patch -p1 < $SCRIPT_DIRECTORY/gcc3.patch	&&  
  patch -p0 < $SCRIPT_DIRECTORY/nmea_fix.diff	&&
  default_build

) > $C_FIFO 2>&1

