(
  cd  abi                                           &&

  ./autogen.sh                                      &&
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
