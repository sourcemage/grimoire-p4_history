(

  sedit  "s/\$(CFLAGS)/\$(CFLAGS) $CFLAGS/"  Makefile
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
