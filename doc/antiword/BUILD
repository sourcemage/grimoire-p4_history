(

  rm    Makefile
  echo  "CFLAGS = $CFLAGS -DNDEBUG"  >  Makefile
  grep  -v  "^CFLAGS"  Makefile.Linux  >>  Makefile
  sedit  "s/local\///"  Makefile

  make                                 &&
  prepare_install                      &&
  make global_install                  &&

  cp  Docs/antiword.1  /usr/man/man1   &&
  chmod 644 /usr/man/man1/antiword.1   &&

  mkdir /usr/doc/antiword              &&
  cp  Docs/*  /usr/doc/antiword        &&
  chmod 644 /usr/doc/antiword/*

) > $C_FIFO 2>&1
