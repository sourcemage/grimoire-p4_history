(
sedit "s/CFLAGS=/CFLAGS=$CFLAGS /g" Makefile     &&
sedit "s/\/usr\/local\/bin/\/usr\/bin/g" Makefile &&

  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
