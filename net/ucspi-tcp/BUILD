(

  sedit  "s/-O2/$CFLAGS/"  conf-cc                            &&
  sedit  "s/-s/$LDFLAGS/"  conf-ld                            &&
  sedit  "s!/local!!"      conf-home                          &&

  sedit  "s/extern int errno;/#include <errno.h>/"  error.h   &&

  make                                                        &&
  prepare_install                                             &&
  make setup check

) > $C_FIFO 2>&1
