(

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
	       --enable-mt	\
	       --with-qt-dir=/usr/lib/qt3       \
	       $OPTS                &&
  make                              &&
  make    install

) > $C_FIFO 2>&1
