(
  ./configure --prefix=/usr $OPTS  &&
#  sedit "s/-O2/$CFLAGS/;s|/local||" Makefile   &&
  sedit "s/-O2/$CFLAGS/" Makefile   &&
  make                   &&
  prepare_install        &&
  make    install        
) > $C_FIFO 2>&1
