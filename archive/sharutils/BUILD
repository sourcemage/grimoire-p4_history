(

  ./configure  --prefix=${INSTALL_ROOT}/usr       \
               --with-gnu-gettext  \
	       $OPTS		   &&
  make                             &&
  prepare_install                  &&
  make    install

) > $C_FIFO 2>&1
