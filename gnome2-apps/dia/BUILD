(
                                                                                                                           
  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  make    install                                   &&
  cp -R shapes/Cisco ${INSTALL_ROOT}/usr/share/dia/shapes

                                                                                                                           
) > $C_FIFO 2>&1

