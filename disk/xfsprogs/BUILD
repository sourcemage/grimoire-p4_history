(

  patch -p0  <  $SCRIPT_DIRECTORY/Makefile.patch  &&

  export  OPTIMIZER=$CFLAGS         &&
  export  DEBUG=-DNDEBUG            &&
  rm      configure                 &&
  make    configure                 &&
  make                              &&
  prepare_install                   &&
  make install install-dev install-lib

) > $C_FIFO 2>&1
