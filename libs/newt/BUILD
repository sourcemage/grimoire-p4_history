(

  ./configure  --build=$BUILD        \
               --prefix=$INSTALL_ROOT/usr         \
               --exec-prefix=$INSTALL_ROOT/usr    \
               --sysconfdir=$INSTALL_ROOT/etc     \
               --localstatedir=$INSTALL_ROOT/var  \
               $OPTS                 &&

  sedit "s:/usr/include:${INSTALL_ROOT}/usr/include:g" Makefile &&
  sedit "s:prefix = /usr:prefix = ${INSTALL_ROOT}/usr:" Makefile &&
  make                               &&
  prepare_install                    &&
  make install

) > $C_FIFO 2>&1

