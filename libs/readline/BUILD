(

  ./configure  --build=$BUILD                            \
               --prefix=${INSTALL_ROOT}/usr              \
               --libdir=${INSTALL_ROOT}/lib              \
               --infodir=${INSTALL_ROOT}/usr/share/info  \
               --mandir=${INSTALL_ROOT}/usr/share/man    \
               $OPTS                         &&
  make  shared                               &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1
