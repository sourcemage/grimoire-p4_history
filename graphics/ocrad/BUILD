(
  sedit "s/-O2/$CFLAGS/" Makefile.in			&&
  sedit "s|/local||" configure				&&
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS	&&
  make                   		&&
  prepare_install        		&&
  make    install        		&&
  make    install-man
) > $C_FIFO 2>&1
