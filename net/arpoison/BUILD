(

  sedit  "s/-Wall/-Wall $CFLAGS/"  Makefile

  make                            &&
  prepare_install                 &&

  cp arpoison /usr/sbin/arpoison  &&
  cp arpoison.8 /usr/man/man8

) > $C_FIFO 2>&1
