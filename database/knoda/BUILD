(
# temporary fix for errors in Python includes
  rm -r python					&&
  sedit "s/(python)/()/" configure.in.in	&&
  make -f Makefile.cvs				&&
  
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
  make                   &&
#  sedit "s/-Wno-long-long//;s/-Wall//;s/-pedantic//" python/Makefile	&&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
