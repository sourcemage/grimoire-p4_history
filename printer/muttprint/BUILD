(

  sedit  's:/usr/local:${INSTALL_ROOT}/usr:'                   Makefile  &&
  sedit  's:/usr/share/doc/packages:${INSTALL_ROOT}/usr/doc:'  Makefile  &&
  sedit  's:/share/man:${INSTALL_ROOT}/man:'                   Makefile  &&

  prepare_install                                                        &&
  make    install

) > $C_FIFO 2>&1
