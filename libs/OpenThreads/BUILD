(
  sedit "s/-O2/\"$CFLAGS\"/"  Make/makedefs  &&
  make opt             &&
  prepare_install      &&
  make  INST_LOCATION=${INSTALL_ROOT}/usr install

) > $C_FIFO 2>&1
