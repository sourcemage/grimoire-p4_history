(

  patch -p1 < $SCRIPT_DIRECTORY/Makefile.patch  &&
  
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
