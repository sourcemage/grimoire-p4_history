(

  # silence the beast
  patch -p1 < $SCRIPT_DIRECTORY/Makefile.patch &&

  perl Makefile.PL &&
  make             &&
  make test        &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
