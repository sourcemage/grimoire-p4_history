(
  ./configure  --build=$BUILD        \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                 &&
  make clean &&
  make &&

  prepare_install &&

  make install &&

  eagleconfig

) > $C_FIFO 2>&1  
