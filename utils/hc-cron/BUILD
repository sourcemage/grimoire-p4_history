(

  sedit  's:$(DESTROOT)/sbin:/sbin:'  Makefile     &&
  sedit  's:$(DESTROOT)/bin:/bin:'    Makefile     &&
  sedit  "s/SYS_TIME_H 1/SYS_TIME_H 0/"  compat.h  &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1
