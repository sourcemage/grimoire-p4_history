(

  cd  khtml                              &&
  patch  -p0  <  $SOURCE_CACHE/$SOURCE2  &&
  cd  ..                                 &&

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-debug       \
               --enable-final        \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

)  >  $C_FIFO  2>&1
