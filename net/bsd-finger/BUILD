(

  patch -p1  <  $SCRIPT_DIRECTORY/bsd-finger-0.17.patch
  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
