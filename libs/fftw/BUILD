(

  ./configure  --prefix=/usr        \
               --enable-shared      \
               --enable-i386-hacks  &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
