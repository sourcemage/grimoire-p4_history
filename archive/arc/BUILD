(
  sedit  "s:-O:$CFLAGS:"  Makefile                  &&
  patch -p1 < $SCRIPT_DIRECTORY/arc521e-linux.diff  &&
  make                                              &&
  prepare_install                                   &&
  cp  marc arc  /usr/bin                            &&
  cp arc.1 /usr/man

) > $C_FIFO 2>&1
