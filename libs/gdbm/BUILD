(

  sedit  "s/-O/$CFLAGS/"  Makefile.in

  ./configure  --prefix=/usr        &&
  make                              &&
  prepare_install                   &&
  make  prefix=/usr install         &&
  make  prefix=/usr install-compat  &&
  ln    -sf  libgdbm.so.3.0.0     /usr/lib/libndbm.so  &&
  ln    -sf  /usr/lib/libgdbm.la  /usr/lib/libndbm.la  &&
  ln    -sf  /usr/lib/libgdbm.a   /usr/lib/libndbm.a

) > $C_FIFO 2>&1
