(
  cd libpcap-0.7.2                           &&
  autoconf                                   &&
  cd ..                                      &&
  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                 &&
  make dep                                   &&
  make                                       &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1
