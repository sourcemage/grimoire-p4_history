(

  ./configure  --build=$BUILD     \
               --prefix=/usr      \
               --libdir=/lib      \
               --with-normal      \
               --with-shared      \
               --disable-termcap  \
	       $OPTS		  &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
