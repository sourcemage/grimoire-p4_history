(
  export CFLAGS=${CFLAGS/\-z combreloc/} &&
  configure --prefix=/usr &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
