(
  cat $SCRIPT_DIRECTORY/*.patch | patch  -p1 &&
  ./configure --prefix=/usr           &&
  make                                &&
  prepare_install                     &&
  make install

) > $C_FIFO 2>&1
