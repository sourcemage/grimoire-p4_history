(

  ./configure  --build=$BUILD   \
               --prefix=/usr    \
               --enable-shared  \
               $OPTS            &&
  make                          &&
  prepare_install               &&
  make    install

) > $C_FIFO 2>&1
