(

# sedit  "s/-O2/$CFLAGS/"  Makefile  &&
  make  LIBDIR=/usr/lib              &&
  prepare_install                    &&
  make  LIBDIR=/usr/lib              \
        BINDIR=/usr/sbin             \
        MANDIR=/usr/man              \
        INCDIR=/usr/include install  \
        install

) > $C_FIFO 2>&1
