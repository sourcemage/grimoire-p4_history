(

  ./configure  --host=$HOST                              \
               --build=$BUILD                            \
               --prefix=/usr                             \
               --datadir=/usr/share/misc                 \
               $OPTS                                     &&
  make                                                   &&
  prepare_install                                        &&
  make prefix=${INSTALL_ROOT}/usr datadir=${INSTALL_ROOT}/usr/share/misc install


) > $C_FIFO 2>&1
