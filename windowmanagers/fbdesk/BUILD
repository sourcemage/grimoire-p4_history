(
  patch  -p1  <  ${SCRIPT_DIRECTORY}/gcc-3.3.patch  &&

  ./configure --prefix=${INSTALL_ROOT}/usr  &&
  make                                      &&
  prepare_install                           &&
  make    install                               

) > $C_FIFO 2>&1
