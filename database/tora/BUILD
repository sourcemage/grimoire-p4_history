(
  ./configure 	--prefix=/usr \
		--without-oracle \
		$OPTS &&
  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
