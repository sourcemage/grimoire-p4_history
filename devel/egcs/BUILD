(

  patch -p1 < $SCRIPT_DIRECTORY/egcs-1.1.2-glibc-2.2.patch 	&&

  ./configure  --host=$BUILD          				\
               --prefix=/opt/egcs     				\
               --enable-shared   				\
	       $OPTS						&&
  make  bootstrap                				&&
  prepare_install                				&& 
  make  install 

) > $C_FIFO 2>&1
