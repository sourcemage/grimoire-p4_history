(

  patch -p1 < $SCRIPT_DIRECTORY/cinelerra-1.1.6-shared.patch  &&

  make             &&
  prepare_install  &&
  make    install
  
) > $C_FIFO 2>&1
