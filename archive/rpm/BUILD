(
  export LDFLAGS=${LDFLAGS/-z combreloc/} &&
  configure --prefix=${INSTALL_ROOT}/usr &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
