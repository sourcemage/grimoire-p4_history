(

  sedit  "s/prefix=\/usr\/local/prefix=\/usr/"  Makefile  &&
  sedit  "s/OPTS=-O2/OPTS=\$\(CFLAGS\)/"        Makefile  &&

  make             &&
  prepare_install  &&
  make    install       

) > $C_FIFO 2>&1
