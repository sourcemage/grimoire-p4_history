(
  sedit "s/-O2/$CFLAGS/" Makefile &&
  make             &&
  prepare_install  &&
  install  -s  rpmunpack  /usr/bin

) > $C_FIFO 2>&1
