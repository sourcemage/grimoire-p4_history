(

  patch  -p1  <  ${SCRIPT_DIRECTORY}/format.C.patch  &&

  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  make                                      &&
  prepare_install                           &&
  install  -m755  html2text  /usr/bin       &&
  install  -m644  html2text.1.gz            \
                  /usr/share/man/man1       &&
  install  -m644  html2textrc.5.gz          \
                  /usr/share/man/man5

) > $C_FIFO 2>&1
