(

  cd  make/linux   &&
  sedit  "s:/usr/local:${INSTALL_ROOT}/usr:"  Makefile  &&
  make  INSTALL_ROOT=${INSTALL_ROOT}  &&
  prepare_install                     &&
  make  INSTALL_ROOT=${INSTALL_ROOT}  install

) > $C_FIFO 2>&1
