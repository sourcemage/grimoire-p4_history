(
  sedit "/^CFLAGS/d;s|/usr/local|${INSTALL_ROOT}/usr|" Makefile	&&
  sedit "s/^CFLAGS =/CFLAGS+=/" tnef/Makefile			&&
  sedit "/^CFLAGS/d" ripOLE/Makefile				&&
  make                   					&&
  make libripmime						&&
  prepare_install        					&&
  make    install        					&&
  cp libripmime.a ${INSTALL_ROOT}/usr/lib
) > $C_FIFO 2>&1
