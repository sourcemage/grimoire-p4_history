(
  sedit "s:/usr/local/:/usr/:" Makefile &&
  sedit "s/-Wall/$CFLAGS/" Makefile &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
