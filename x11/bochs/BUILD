(

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --enable-cdrom=yes   \
               --enable-sb16=linux  &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
