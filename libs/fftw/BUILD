(

  ./configure  --prefix=/usr        \
               --enable-shared      \
               --enable-i386-hacks  \
	       $OPTS		    &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
