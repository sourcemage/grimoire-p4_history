(

  ./configure  --host=$BUILD  \
               --prefix=/usr  &&
  make                        &&
  make depend                 &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
