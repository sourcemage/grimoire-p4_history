(

  ./configure  Linux               \
               --prefix=/usr       \
               --CFLAGS="$CFLAGS"  \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install

) > $C_FIFO 2>&1
