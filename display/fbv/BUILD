(

  sedit  's/^LIBS.*/& -lz -lm/'  Makefile  &&

  ./configure  --prefix=/usr  $OPTS  &&
  make  &&
  prepare_install  &&
  make  install                             

) > $C_FIFO 2>&1
