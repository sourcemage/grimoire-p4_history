(

  sedit "s/BINDIR = \/usr\/local\/sbin/BINDIR = \/usr\/sbin/" Makefile
  sedit "s/MANDIR = \/usr\/local\/man/MANDIR = \/usr\/man/" Makefile
  sedit "s/gcc -O2 -Wall/gcc $CFLAGS/" Makefile

  make &&
  prepare_install &&
  make install

) > $C_FIFO 2>&1
