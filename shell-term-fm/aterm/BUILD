(

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-fading    \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
