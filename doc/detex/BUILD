(
  sedit  "s:-O:$CFLAGS:"   Makefile                                    &&
  sedit  's:= lex:= flex:'  Makefile                                   &&
  sedit  's:-ll:-lfl:' Makefile                                        &&
  make                                                                 &&
  prepare_install                                                      &&
  cp detex ${INSTALL_ROOT}/usr/bin                                     &&
  ln -s ${INSTALL_ROOT}/usr/bin/detex ${INSTALL_ROOT}/usr/bin/delatex  &&
  cp detex.1l ${INSTALL_ROOT}/usr/man/man1

) > $C_FIFO 2>&1
