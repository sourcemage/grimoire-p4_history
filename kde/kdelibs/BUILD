(

  patch  configure  $SCRIPT_DIRECTORY/alsa-1.0.patch  &&

  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --disable-debug       \
               --enable-final        \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

)  >  $C_FIFO  2>&1
