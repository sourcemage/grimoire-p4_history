(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --libdir=/lib         &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
