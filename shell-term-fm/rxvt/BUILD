(

  ./configure  --build=$BUILD		\
               --prefix=/usr		\
	       --enable-everything	\
               $OPTS			&&
  make					&&
  
  prepare_install			&&
  make  install

) > $C_FIFO 2>&1  
