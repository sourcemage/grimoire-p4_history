(

  patch  dosfsck/boot.c  $SCRIPT_DIRECTORY/boot.patch  &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
