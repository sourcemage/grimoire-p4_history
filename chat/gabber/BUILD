(
  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-optimize  \
               $OPTS              &&
  sedit  "s/-I\/usr\/include //g" Makefile &&
  sedit  "s/-I\/usr\/include //g" src/Makefile &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
