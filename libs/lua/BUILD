(
  sedit  "s/-O2/$CFLAGS/" config  &&
  make INSTALL_ROOT=/usr          &&
  make INSTALL_ROOT=/usr so       &&
  prepare_install                 &&
  make INSTALL_ROOT=/usr install  

) > $C_FIFO 2>&1

