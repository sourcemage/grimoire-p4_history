(

  sedit  "s/CFLAGS   = -Wall/CFLAGS   = $CFLAGS/"  Makefile  &&

  make                        &&
  prepare_install             &&

  install -m 0755 disktype    /usr/bin   &&
  install -m 0644 disktype.1  /usr/share/man/man1

) > $C_FIFO 2>&1
