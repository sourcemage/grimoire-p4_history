(

  sedit  "s/-O/$CFLAGS/"  Makefile.in

  ./configure  --prefix=/usr        &&
  make                              &&
  prepare_install                   &&
  make  prefix=/usr install         &&
  make  prefix=/usr install-compat  &&
  ln    -sf  libgdbm.so.2.0.0  /usr/lib/libndbm.so

) > $C_FIFO 2>&1
