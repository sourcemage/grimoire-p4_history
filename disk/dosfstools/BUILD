(

  patch -p1 < $SCRIPT_DIRECTORY/linux-2.6.patch &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
