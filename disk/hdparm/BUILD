(

  sedit  "s/-O2/$CFLAGS/"  Makefile
  make                   &&
  prepare_install        &&
  make  destdir=/usr     \
        sbindir=/sbin    \
        mandir=/usr/man  \
        install

) > $C_FIFO 2>&1
