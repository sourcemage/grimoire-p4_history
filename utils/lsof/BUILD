(

  cd  ${SPELL}_${VERSION}_src       &&
  yes |  ./Configure  linux         &&
  sedit  "s/-O/$CFLAGS/"  Makefile  &&
  make                              &&
  prepare_install                   &&
  cp  lsof    $INSTALL_ROOT/usr/bin              &&
  cp  lsof.8  $INSTALL_ROOT/usr/man/man8

) > $C_FIFO 2>&1
