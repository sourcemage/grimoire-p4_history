(
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
	       --with-ncurses=/usr	   \
               --localstatedir=/var/run    \
	       $OPTS		      &&	
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
