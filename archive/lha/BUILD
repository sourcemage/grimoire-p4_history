(

  sedit  "s:/local::"  Makefile  &&
  sedit  "s:MANSECT\ =\ n:MANSECT\ =\ 1:"  Makefile  &&
  sedit  "s:/usr/bin:${INSTALL_ROOT}/usr/bin:" Makefile &&
  sedit  "s:/usr/man:${INSTALL_ROOT}/usr/man:" Makefile &&
  sedit  "s/-O2/$CFLAGS/" Makefile &&
  cp $SCRIPT_DIRECTORY/lha.n man/lha.n &&
  cd src/ &&
  patch -p0 < $SCRIPT_DIRECTORY/lha.patch &&
  cd - &&
  make                           &&
  prepare_install                &&
  make    install

) > $C_FIFO 2>&1
