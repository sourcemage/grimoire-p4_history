(

  sedit  "s:-O3:$CFLAGS:"  src/configure
  cd     src
  ./configure  --prefix=/usr   \
               --etcdir=/etc   \
               --dynamic       \
               --nouseuid      \
               --pthread       \
               $OPTS           &&
  make                         &&
  prepare_install              &&
  make    install

) > $C_FIFO 2>&1
