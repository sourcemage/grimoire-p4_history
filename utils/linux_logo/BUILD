(

  sedit  "s:/local::"      Makefile
  sedit  "s/-O2/$CFLAGS/"  Makefile
  make    logos-all  &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
