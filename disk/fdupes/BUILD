(

  sedit "s/-Wall/$CFLAGS/" Makefile  &&
  sedit "s:/usr/local:/usr:" Makefile  &&
  make                            &&
  make HOME=/usr install

) > $C_FIFO 2>&1
