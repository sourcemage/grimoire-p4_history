(
  sedit "s/-O2/$CFLAGS/" Makefile &&
  sedit "s:cp afio /usr/bin:cp afio ${INSTALL_ROOT}/usr/bin:" Makefile &&
  sedit "s:cp afio.1 /usr/man/man1:cp afio.1 ${INSTALL_ROOT}/usr/man/man1:" Makefile &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
