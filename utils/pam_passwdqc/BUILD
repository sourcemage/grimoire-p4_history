(

  sedit  "s/-c -Wall -fPIC -O2/-c -Wall $CFLAGS/"  Makefile

  make              &&
  prepare_install   &&
  make install

) > $C_FIFO 2>&1
