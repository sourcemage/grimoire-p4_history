(
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var        \
	       --enable-dns		   &&
  make                                     &&
  prepare_install                          &&
  make    install                          
) > $C_FIFO 2>&1
