(

  sedit  "s:/local::"  Makefile  &&
  sedit  "s:MANSECT\ =\ n:MANSECT\ =\ 1:"  Makefile  &&
  make                           &&
  prepare_install                &&
  make    install

) > $C_FIFO 2>&1
