(

  sedit  "s/-g//"  Makefile  &&

  make  &&
  prepare_install  &&
  install  -m 755  driftnet  /usr/bin/driftnet  &&
  install  -m 644  driftnet.1  /usr/share/man/man1

) > $C_FIFO 2>&1
