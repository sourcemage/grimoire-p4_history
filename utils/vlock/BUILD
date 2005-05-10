(
  sedit  "s/-O2/$CFLAGS/"  Makefile
  make &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cp        vlock          /usr/bin
  gzip  -9  vlock.1
  cp        vlock.1.gz     /usr/man/man1

)
