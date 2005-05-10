(

  sedit  "s/sudo//g"       Makefile
  sedit  "s/-O2/$CFLAGS/"  Makefile
  sedit  "s:/local::"      Makefile
  make
  prepare_install
  make    install

)  > $C_FIFO 2>&1
