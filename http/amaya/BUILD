(

  cd Amaya &&
  mkdir obj &&
  cd obj &&
  ../configure \
    --prefix=/usr \
    --with-dav \
    $OPTS &&
  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1
