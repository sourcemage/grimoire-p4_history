(
  ./configure  --build=${BUILD}   \
               --prefix=${INSTALL_ROOT}/usr      \
               --sbindir=${INSTALL_ROOT}/sbin    \
               --libdir=${INSTALL_ROOT}/lib      \
               --sysconfdir=${INSTALL_ROOT}/etc  \
               ${OPTS}            &&
  make                            &&
  prepare_install                 &&
  make    install

) > ${C_FIFO} 2>&1

