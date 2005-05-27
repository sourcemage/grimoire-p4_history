(

  ./configure  --prefix=/usr                    \
               --enable-require-all-recipients  \
               --enable-libitdl-install=no      \
               $OPTS				&&
  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
