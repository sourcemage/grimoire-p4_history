(

  ./configure  --prefix=/usr      \
               --mandir=/usr/man  &&
  make                            &&
  prepare_install                 &&
  make    install                 &&
  make    install.man

) > $C_FIFO 2>&1
