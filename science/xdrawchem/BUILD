(

  mkdir -p /usr/qt                        &&
  ln -s /usr/lib /usr/qt/lib              &&
  ln -s /usr/include/qt /usr/qt/include   &&
  ./configure --with-qtdir=/usr/qt        &&
  make                                    &&
  prepare_install                         &&
  make install

) > $C_FIFO 2>&1
