(

  sedit  "s:/local::"  Makefile  &&
  sedit  "s:MANSECT\ =\ n:MANSECT\ =\ 1:"  Makefile  &&
  sedit  "s/-O2/$CFLAGS/" Makefile &&
  cp $SCRIPT_DIRECTORY/lha.n man/lha.n &&
  make                           &&
  prepare_install                &&
  make    install

) > $C_FIFO 2>&1
