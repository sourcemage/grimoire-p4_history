(

  ./configure  --host=$BUILD  \
               --prefix=/usr  \
	       $OPTS	      &&
  make                        &&
  make depend                 &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1
