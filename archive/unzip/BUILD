(

  sedit  "s/-O /$CFLAGS /"  unix/Makefile
  make  -f unix/Makefile generic  &&
  prepare_install                 &&
  make  prefix=/usr -f unix/Makefile install

) > $C_FIFO 2>&1
