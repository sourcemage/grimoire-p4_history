(

  # Fixes Bug #1108
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sbindir=/sbin       \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
