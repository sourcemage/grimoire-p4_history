(

  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --libdir=${INSTALL_ROOT}/lib  \
	       $OPTS	                     &&
  make  shared                               &&
  prepare_install                            &&
  make    install

) > $C_FIFO 2>&1
