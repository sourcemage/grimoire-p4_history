(
  cd wmsensormon                                &&
  sedit "s:/usr/local/bin:${INSTALL_ROOT}/usr/bin:g" Makefile  &&
  make                                          &&
  prepare_install                               &&
  make install
) > $C_FIFO 2>&1
