(

  ./configure  --prefix=${INSTALL_ROOT}/usr              \
               --sysconfdir=${INSTALL_ROOT}/etc/a2ps     \
               --infodir=${INSTALL_ROOT}/usr/share/info  \
               --mandir=${INSTALL_ROOT}/usr/share/man    \
               $OPTS                                  &&
  make                                                &&
  prepare_install                                     &&
  make    install                                     &&
  rm  -f  /a2ps*.el

) > $C_FIFO 2>&1
