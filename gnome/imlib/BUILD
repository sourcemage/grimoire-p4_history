(

  export CPPFLAGS="$CPPFLAGS -w -I/usr/include/libpng12"

  ./configure  --prefix=${INSTALL_ROOT}/usr            \
               --sysconfdir=${INSTALL_ROOT}/etc/imlib  \
               $OPTS			               &&
  make                                                 &&
  prepare_install                                      &&
  make    install

) > $C_FIFO 2>&1
