(

  patch  -p1  <  $SCRIPT_DIRECTORY/gcc3.patch  &&

  ./configure  --prefix=${INSTALL_ROOT}/usr  --with-c++-compiler=g++  $OPTS  &&
  make  &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
