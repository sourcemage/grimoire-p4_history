(

  ./configure --prefix=${INSTALL_ROOT}/usr         \
              --sysconfdir=${INSTALL_ROOT}/etc     \
              --localstatedir=${INSTALL_ROOT}/var  \
              $OPTS                                &&
  make             &&
  prepare_install  &&
  mkdir -p /usr/share/gnome/apps/Utilities  &&
  make    install

) > $C_FIFO 2>&1
