(

  sedit  '/^CFLAGS/d'           Makefile  &&
  sedit  's/-o/$(LDFLAGS) -o/'  Makefile  &&

  make                                    &&
  prepare_install                         &&
  make  install

) > $C_FIFO 2>&1
