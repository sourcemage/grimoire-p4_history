(

  ./config  --prefix=/usr          \
            --openssldir=/etc/ssl  \
            shared                 &&
  make                             &&
  prepare_install              
  make  MANDIR=/usr/share/man  install

) > $C_FIFO 2>&1
