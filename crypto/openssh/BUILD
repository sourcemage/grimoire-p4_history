(

  ./configure  --prefix=/usr          \
               --sysconfdir=/etc/ssh  \
               --with-md5-passwords   \
               $OPTS                  &&
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
