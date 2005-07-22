(

  sedit  "s/CFLAGS=-O2 -Wall/CFLAGS=$CFLAGS/"  Makefile

  make             &&
  prepare_install  &&
  make  install                   

) > $C_FIFO 2>&1
