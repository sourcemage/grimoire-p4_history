(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --enable-static=yes   \
               $OPTS                 &&

  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
