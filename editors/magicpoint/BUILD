(

  ./configure --prefix=${INSTALL_ROOT}/usr   \
          --sysconfdir=${INSTALL_ROOT}/etc   \
       --localstatedir=${INSTALL_ROOT}/var   \
                       $OPTS                 &&
  xmkmf                                      &&
  make    Makefiles                          &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  make    install.man

) > $C_FIFO 2>&1
