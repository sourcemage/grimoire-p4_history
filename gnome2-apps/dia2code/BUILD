(
                                                                                                                           
  ./configure  --build=$BUILD                          \
               --prefix=${INSTALL_ROOT}/usr            \
               --sysconfdir=${INSTALL_ROOT}/etc        \
               --localstatedir=${INSTALL_ROOT}/var     \
               $OPTS                                   &&
  sedit  "s/libxml2/gnome-xml/g" dia2code/Makefile     &&
  make                                                 &&
  prepare_install                                      &&
  make    install                                   

                                                                                                                           
) > $C_FIFO 2>&1

