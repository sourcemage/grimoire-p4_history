(
  sedit  "s/-O2/$CFLAGS/"  Makefile
  make             &&
  prepare_install  &&
  make  PREFIX=$INSTALL_ROOT/usr install

) > $C_FIFO 2>&1
