(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               --disable-nls   \
               $OPTS           &&
  make                         &&
  prepare_install              &&
  make    install              &&
  ln  -sf  flex  /usr/bin/lex

) > $C_FIFO 2>&1
