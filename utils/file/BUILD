(

  ./configure  --build=$BUILD             \
               --prefix=/usr              \
               --datadir=/usr/share/misc  &&
  make                                    &&
  prepare_install                         &&
  make    install

) > $C_FIFO 2>&1
