(
#  ./configure --prefix=$INSTALLROOT/usr $OPTS &&
  sedit "s:/local::;s/-O2//" Makefile.m4	&&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
