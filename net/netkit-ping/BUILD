(

  ./configure  --prefix=/usr  $OPTS   &&
  make  SUB=ping              		    &&
  prepare_install             		    &&
  make  SUB=ping  install

) > $C_FIFO 2>&1 
