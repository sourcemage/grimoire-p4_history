(
  patch -p1 < $SCRIPT_DIRECTORY/partimage-0.6.1.patch &&
  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-debug       \
               --enable-final        \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
