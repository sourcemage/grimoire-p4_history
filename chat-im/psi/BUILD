(

  export QTDIR=/usr

  ./configure --prefix=/usr $OPTS                           &&
  cd $SOURCE_DIRECTORY                                      &&
  sedit "s/QTDIR)\/include/QTDIR)\/include\/qt/g" Makefile  &&
  make                                                      &&
  prepare_install                                           &&
  make install

) > $C_FIFO 2>&1
