(
  ./configure --prefix=/usr       \
              --with-gtk          \
              --enable-zipstream  \
              --disable-optimise  &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
