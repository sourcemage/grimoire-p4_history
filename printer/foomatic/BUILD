(
  sedit  "s/-O3/$CFLAGS/"  Makefile

  make  PREFIX=/usr                  &&
  prepare_install                    &&
  make  PREFIX=/usr  install

) > $C_FIFO 2>&1
