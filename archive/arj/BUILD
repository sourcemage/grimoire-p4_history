(

  cd gnu					&&

  autoconf					&&
  ./configure 	--prefix=/usr 			\
		--localstatedir=/var		&&
		
  cd ..						&&
  make -f GNUmakefile prepare			&&
  make -f GNUmakefile				&&

  prepare_install                               &&
 
  make -f GNUmakefile install				

) > $C_FIFO 2>&1  
