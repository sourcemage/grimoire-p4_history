(
  sedit "s/CFLAGS=/CFLAGS+=/;s/-3.2//;s:/local::" Makefile	&&
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
