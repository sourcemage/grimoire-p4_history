(

  ./configure --prefix=/usr \
              --with-unixODBC=/usr/include \
              $OPTS

  make
  prepare_install
  make install

) > $C_FIFO 2>&1
