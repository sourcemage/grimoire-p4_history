(
  patch -p1 < $SCRIPT_DIRECTORY/gcc3.patch	&&  
  patch -p1 < $SCRIPT_DIRECTORY/gpsdc.patch	&&  
  patch -p0 < $SCRIPT_DIRECTORY/nmea_fix.diff	&&
  default_build					&&
  cp $SOURCE_DIRECTORY/Gps $SOURCE_DIRECTORY/XGpsSpeed /etc/X11/app-defaults/

) > $C_FIFO 2>&1

