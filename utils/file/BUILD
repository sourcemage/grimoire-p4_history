(

  ./configure  --build=$BUILD                            \
               --prefix=${INSTALL_ROOT}/usr              \
               --datadir=${INSTALL_ROOT}/usr/share/misc  \
               $OPTS                                     &&
  make                                                   &&
  prepare_install                                        &&
  make    install

) > $C_FIFO 2>&1
