(

  ./configure --prefix=/usr     &&
  cp -rvf $SCRIPT_DIRECTORY/Makefile ${BUILD_DIRECTORY}/${SPELL}-${VERSION}/src &&
  make                          &&
  prepare_install               &&
  make install

) > $C_FIFO 2>&1
