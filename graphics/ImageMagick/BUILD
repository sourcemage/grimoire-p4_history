(

  ./configure  --build=$BUILD   \
               --prefix=/usr    \
               --enable-shared  &&
  make                          &&
  prepare_install               &&
  make    install

) > $C_FIFO 2>&1
