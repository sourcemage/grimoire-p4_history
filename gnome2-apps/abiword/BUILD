(

  patch  -p0  <  $SCRIPT_DIRECTORY/gcc-3.4.patch    &&
  cd  abi                                           &&

  sedit "s/-pedantic -ansi//g" configure            &&
  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --enable-threads                     \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  make    install

) > $C_FIFO 2>&1
