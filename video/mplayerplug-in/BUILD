(

  ./configure --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                &&
  make                                      &&
  prepare_install                           &&
  cp  -p  mplayerplug-in.so                 \
  ${INSTALL_ROOT}/usr/lib/mozilla/plugins/


) > $C_FIFO 2>&1
