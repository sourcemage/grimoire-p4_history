(

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-optimize  &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
