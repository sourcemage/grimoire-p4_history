(

  ./configure  --build=${BUILD}                       \
               --prefix=${INSTALL_ROOT}/usr           \
               --sysconfdir=${INSTALL_ROOT}/etc       \
               --localstatedir=${INSTALL_ROOT}/var    \
               ${OPTS}                                &&
  make                                                &&
  prepare_install                                     &&
  make    install install-dev install-lib

)  >  ${C_FIFO}  2>&1
