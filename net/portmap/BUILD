(
  sedit  "s/const char \*what/__const char \*what/"  portmap.c  &&
  patch  -p1  <  $SCRIPT_DIRECTORY/errno_fix.patch              &&

  make  WRAP_DIR=${INSTALL_ROOT}/usr/lib   &&
  prepare_install           &&
  cp  portmap    ${INSTALL_ROOT}/usr/sbin  &&
  cp  pmap_dump  ${INSTALL_ROOT}/usr/sbin  &&
  cp  pmap_set   ${INSTALL_ROOT}/usr/sbin

) > $C_FIFO 2>&1
