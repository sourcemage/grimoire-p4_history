(

  cd gnu					&&

  autoconf					&&
  ./configure 	--prefix=${INSTALL_ROOT}/usr 			\
		--localstatedir=${INSTALL_ROOT}/var		\
		$OPTS				&&
		
  cd ..						&&
  make -f GNUmakefile prepare			&&
  make -f GNUmakefile				&&

  prepare_install                               &&
 
  make -f GNUmakefile install				

) > $C_FIFO 2>&1  
