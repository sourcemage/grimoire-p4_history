(
   ./configure 	--prefix=${INSTALL_ROOT}/usr \
		--enable-shared  \
		--enable-xft \
		$OPTS 	&&
   make						&&
   prepare_install				&&
   make install					

) > $C_FIFO 2>&1  
