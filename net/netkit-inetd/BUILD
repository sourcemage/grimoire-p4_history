(

  ./configure  --prefix=/usr  $OPTS   &&
  make  SUB=inetd              		    &&
  prepare_install             		    &&
  make  SUB=inetd  install

) > $C_FIFO 2>&1 
