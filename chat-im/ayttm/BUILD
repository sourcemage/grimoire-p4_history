(

  if [ "$CVS" = "yes" ] ; then ./gen ; fi &&
  ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
               --localstatedir=${INSTALL_ROOT}/var \
               --enable-xft      \
	       $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
