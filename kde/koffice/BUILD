(

  ./configure  --prefix=/usr         \
               --disable-debug       \
               --enable-objprelink   \
               --enable-final        \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
