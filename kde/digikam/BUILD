(
make -f Makefile.cvs &&
#  cd temp/CVS/digikam 	&&
  ./configure --prefix=/usr $OPTS &&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
