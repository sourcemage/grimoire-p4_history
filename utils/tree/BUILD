(

  sedit "s/CFLAGS=-O2 -Wall -fomit-frame-pointer #-m486/CFLAGS=$CFLAGS/" Makefile
  sedit "s/LDFLAGS.*=/& ${LDFLAGS} /" Makefile
  sedit "s/prefix = \/usr\/local/prefix=\/usr/" Makefile

  make &&
  prepare_install &&
  make install

) > $C_FIFO 2>&1
