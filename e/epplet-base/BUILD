(
  ./autogen.sh --prefix=${INSTALL_ROOT}/usr         \
               --enable-fsstd                       \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  &&
  make                                              &&
  prepare_install                                   &&
  make    install

) > $C_FIFO 2>&1
