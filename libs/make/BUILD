(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               $OPTS           &&
  make                         &&
  prepare_install              &&
  make    install              &&
  chmod  a-s  /usr/bin/make

) > $C_FIFO 2>&1
