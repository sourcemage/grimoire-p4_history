(

  ./configure  --prefix=/usr             \
               --sysconfdir=/etc/imlib2  \
	       --includedir=""		 &&
  make                                   &&
  prepare_install                        &&
  make    install			 &&
  mv /Imlib2.h /usr/include

) > $C_FIFO 2>&1
