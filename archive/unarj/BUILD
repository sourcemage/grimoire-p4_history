(
  sedit  "s:-O2:$CFLAGS:"  Makefile              &&
  sedit  "s:/usr/local/bin:/usr/bin:"  Makefile  &&
  make                                           &&
  prepare_install                                &&
  make    install

) > $C_FIFO 2>&1
