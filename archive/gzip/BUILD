patch -p1 < $SCRIPT_DIRECTORY/gzip-1.2.4b.patch

(

  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --bindir=${INSTALL_ROOT}/bin  &&
  make                                       &&
  prepare_install                            &&
  make  bindir=${INSTALL_ROOT}/bin  install

) > $C_FIFO 2>&1
