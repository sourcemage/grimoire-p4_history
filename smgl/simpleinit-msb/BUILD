(

  patch  -p1  <  $SCRIPT_DIRECTORY/simpleinit.c.patch  &&

  ./configure                             &&
  make  OPT="$CFLAGS"                     &&
  prepare_install                         &&
  make  DESTDIR=${INSTALL_ROOT}           \
           ROOT=${INSTALL_ROOT}           \
        install                           &&

  install  -m 644  $SCRIPT_DIRECTORY/inittab  ${INSTALL_ROOT}/etc/

) > $C_FIFO 2>&1
