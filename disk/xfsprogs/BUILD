(

  patch -p0  <  $SCRIPT_DIRECTORY/Makefile.patch  &&

  export  OPTIMIZER=-O1             &&
  export  DEBUG=-DNDEBUG            &&
  rm      configure                 &&
  make    configure                 &&
  make                              &&
  prepare_install                   &&
  make    install                   &&
  make    install-dev

) > $C_FIFO 2>&1
