(

  patch  -p1  <  $SCRIPT_DIRECTORY/libebml-gcc3.3.patch

  cd  make/linux   &&
  make  INSTALL_ROOT=${INSTALL_ROOT}  &&
  prepare_install                     &&
  make  INSTALL_ROOT=${INSTALL_ROOT}  install

) > $C_FIFO 2>&1
