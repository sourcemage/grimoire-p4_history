(

  ./configure  --build=$BUILD    			\
               --prefix=/usr     			\
       	       --bindir=${INSTALL_ROOT}/bin		\
	       $OPTS		 			&&
  make                           			&&
  prepare_install                			&&
  make    install                

) > $C_FIFO 2>&1
