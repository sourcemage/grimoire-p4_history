(
  cd wmsensormon                                &&
  sedit "s:/usr/local/bin:${INSTALL_ROOT}/usr/bin:g" Makefile  &&
  sedit "s/CFLAGS = -Wall -O3/CFLAGS = $CFLAGS/" Makefile      &&  
  make                                          &&
  prepare_install                               &&
  make install
) > $C_FIFO 2>&1
