(

 ./configure  --build=$BUILD  --prefix=${INSTALL_ROOT}/usr $OPTS &&
  make  sysconfdir=${INSTALL_ROOT}/etc localstatedir=${INSTALL_ROOT}/var/cache  &&
  prepare_install                                 &&
  make  sysconfdir=${INSTALL_ROOT}/etc localstatedir=${INSTALL_ROOT}/var/cache libexecdir=${INSTALL_ROOT}/usr/bin install

) > $C_FIFO 2>&1
