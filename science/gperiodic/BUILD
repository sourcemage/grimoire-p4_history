(

  ./configure  --prefix=${INSTALL_ROOT}/usr                    \
               --sysconfdir=${INSTALL_ROOT}/etc                \
               --localstatedir=${INSTALL_ROOT}/var             \
               --datadir=${INSTALL_ROOT}/usr                   \
               $OPTS                            &&

  sedit "s:prefix = /usr/local:prefix = ${INSTALL_ROOT}/usr:" po/Makefile              &&

  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
