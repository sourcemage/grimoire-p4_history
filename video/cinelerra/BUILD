(

  patch -p1 < $SCRIPT_DIRECTORY/cinelerra-shared.patch  &&

  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
