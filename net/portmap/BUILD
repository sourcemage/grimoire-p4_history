(

#  sed  s/"const char \*what"/"__const char \*what"/ portmap.c > portmap.c~  &&
#  mv  portmap.c~  portmap.c  &&

  sedit  "s/const char \*what/__const char \*what/"  portmap.c  &&
  patch  -p1  <  $SCRIPT_DIRECTORY/errno_fix.patch              &&

  make  WRAP_DIR=/usr/lib   &&
  prepare_install           &&
  cp  portmap    /usr/sbin  &&
  cp  pmap_dump  /usr/sbin  &&
  cp  pmap_set   /usr/sbin

) > $C_FIFO 2>&1
