(

 ./configure  --build=$BUILD        \
              --prefix=/usr         \
              --sysconfdir=/etc     \
              --localstatedir=/var  \
              $OPTS                 &&
  sedit  "/gradm -P/d"  Makefile    &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
