(

  ./configure  --prefix=/usr      \
               --mandir=/usr/man  \
	       $OPTS		  &&
  make                            &&
  prepare_install                 &&
  make    install                 &&
  make    install.man             &&
  ln -s /usr/bin/tcsh /usr/bin/csh

) > $C_FIFO 2>&1
