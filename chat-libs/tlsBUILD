( 

  sedit "s/tclPort.h/tcl.h/" strncasecmp.c  &&

  ./configure --with-ssl-dir=/usr --prefix=/usr $OPTS  &&

  make             &&
  prepare_install  &&
  make install

) > $C_FIFO 2>&1
