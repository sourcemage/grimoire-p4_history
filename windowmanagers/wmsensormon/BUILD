(

  cd wmsensormon	     &&
  sedit "s/CFLAGS = -Wall -O3/CFLAGS = $CFLAGS/" Makefile &&  
  sedit "s/local\///" Makefile &&  
  make			&&
  prepare_install       &&
  make install
  
) > $C_FIFO 2>&1
