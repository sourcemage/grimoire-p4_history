sedit  "s/\$(FLAGS)/$CFLAGS/"  Makefile
(

  make             &&
  prepare_install  &&
  cp  grtrace  /usr/sbin

) > $C_FIFO 2>&1
