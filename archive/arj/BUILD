  CFLAGS="-O1"                                  &&
  cd gnu					&&

  autoconf					&&
  ./configure 	--prefix=${INSTALL_ROOT}/usr 			\
		--localstatedir=${INSTALL_ROOT}/var		\
		$OPTS				&&
		
  cd ..						&&
  make -f GNUmakefile prepare			&&
  make -f GNUmakefile 
