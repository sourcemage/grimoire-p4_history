(

  ./configure  --prefix=/usr  \
               $OPTS          &&
  chmod  a+x   missing        &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
