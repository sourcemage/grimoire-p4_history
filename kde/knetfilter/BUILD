(

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --localstatedir=/var \
               --disable-debug      \
	       --enable-final       \
	       $OPTS                &&
  make                              &&
  make    install

) > $C_FIFO 2>&1
