(

  sedit  's!/usr/local!/usr!'  Makefile  &&
  sedit  "s/^LDFLAGS =/& $LDFLAGS/"  Makefile  &&

  make  RES_LIB=-lresolv  COPTIM="$CFLAGS"  DEBUGDEFS=""  CDEBUG=""  &&
  prepare_install  &&
  make install

) > $C_FIFO 2>&1
