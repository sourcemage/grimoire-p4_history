(

  sedit  's/automake /automake -a /'  make_configure

  ./make_configure   \
      --prefix=/usr

  cd  cvsunix        &&
  ./configure        \
      --prefix=/usr  &&
  cd  ..             &&
  make               &&
  prepare_install    && 
  make  install

) > $C_FIFO 2>&1
