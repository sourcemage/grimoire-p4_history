(
  sedit "s:INSTALL_PREFIX=/usr/local:INSTALL_PREFIX=${INSTALL_ROOT}/usr:" Makefile &&
  rm ide-smart  &&
  make        &&
  prepare_install                    &&
  make install

) > $C_FIFO 2>&1
