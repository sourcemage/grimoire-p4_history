(

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
               --localstatedir=/var \
               --disable-debug      \
	       --enable-final       \
	       $OPTS                &&
  make  -Wno-deprecated             &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
