(

  ./configure  --prefix=/usr                         &&
  sedit  "s/src doc contrib/src contrib/"  Makefile  &&
  make                                               &&
  prepare_install                                    &&
  make    install
  
) > $C_FIFO 2>&1
