(

  patch -p1 < $SCRIPT_DIRECTORY/xmovie-1.9.9-shared.patch  &&
  
  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
