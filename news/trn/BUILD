(

  ./Configure  -Dprefix=/usr -d  $OPTS  &&
  make                           	&&
  prepare_install                 	&&
  make    install                 	&&
  make    installclean

) > $C_FIFO 2>&1
