(
  sedit "s/-O2/$CFLAGS/" Makefile &&
  pwd &&
  patch -p0 < $SCRIPT_DIRECTORY/patch &&
  make             &&
  prepare_install  &&
  install  -s  rpmunpack  /usr/bin

) > $C_FIFO 2>&1
