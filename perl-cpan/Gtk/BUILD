(

  patch -p1 < $SCRIPT_DIRECTORY/Makefile.diff  &&
  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install

) >$C_FIFO 2>&1
