(

  ./configure --prefix=${INSTALL_ROOT}/usr   \
             --sbindir=${INSTALL_ROOT}/sbin  \
          --sysconfdir=${INSTALL_ROOT}/etc   \
       --localstatedir=${INSTALL_ROOT}/var   \
                       $OPTS                 &&
  make                                       &&
  prepare_install                            &&
  make    install
                                                                                                                             
) > $C_FIFO 2>&1
