(

  ./configure $OPTS                                     &&
  make                                                  &&
  prepare_install                                       &&
  install  -m755  html2text \
                  ${INSTALL_ROOT}/usr/bin               &&
  install  -m644  html2text.1.gz            \
                  ${INSTALL_ROOT}/usr/share/man/man1    &&
  install  -m644  html2textrc.5.gz          \
                  ${INSTALL_ROOT}/usr/share/man/man5

) > $C_FIFO 2>&1
