(

  ./config  --prefix=/usr          \
            --openssldir=/etc/ssl  \
            shared                 &&
  make                             &&
  prepare_install              
  make  MANDIR=/usr/man  install

) > $C_FIFO 2>&1
