(

  cp  Makefile  Makefile.old
  sed 's/\/usr\/local/\/usr/' < Makefile.old > Makefile

  make             &&
  prepare_install  &&
  make man         &&
  make install

) > $C_FIFO 2>&1
