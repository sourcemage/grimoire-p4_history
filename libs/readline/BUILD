(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               --libdir=/lib   &&
  make  shared                 &&
  prepare_install              &&
  make    install

) > $C_FIFO 2>&1
