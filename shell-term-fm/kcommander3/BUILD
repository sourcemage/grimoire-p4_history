(
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var/run	\
	       --enable-mt		\
	       $OPTS		      &&	
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
