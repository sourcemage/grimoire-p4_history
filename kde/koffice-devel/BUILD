(
sedit "s/-ansi//g" configure                                 &&
sedit "s/-pedantic//g" configure                             &&
  ./configure  --prefix=${INSTALL_ROOT}/usr                  \
               --disable-debug                               \
	       $OPTS                                         &&
  make                                                       &&
  prepare_install                                            &&
  make    install

) > $C_FIFO 2>&1
