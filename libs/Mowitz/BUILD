(

  ./configure  --with-xawm=Xaw3d     \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --prefix=/usr 	     \
	       $OPTS	             &&
  make                               &&
  prepare_install                    &&
  make install

)  >  $C_FIFO  2>&1
