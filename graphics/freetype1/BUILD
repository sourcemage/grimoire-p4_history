(

  ./configure  --prefix=/usr    \
               --enable-static  \
               $OPTS            &&
  make                          &&
  prepare_install               &&
  make    install

) > $C_FIFO 2>&1
