(

  sedit  "s/-O2/$CFLAGS/"     Makefile.in   &&
  sedit  "s/-o/$LDFLAGS -o/"  Makefile.in   &&

  export  MANPATH=/usr/man                  &&
  default_build                             &&
  ln  -sf  /usr/man/man8/hping2.8  /usr/man/man8/hping.8

) > $C_FIFO 2>&1
