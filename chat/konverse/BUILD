(

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-final     &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
