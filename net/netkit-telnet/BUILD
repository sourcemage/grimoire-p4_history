(

  patch  -p1  <  $SCRIPT_DIRECTORY/gcc3.patch  &&

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
