(

  sedit   "s/-O/$CFLAGS/"  Makefile  &&
  sedit   "s/-z/-n/"       Makefile  &&

  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
