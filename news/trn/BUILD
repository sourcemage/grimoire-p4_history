(

  ./Configure  -D prefix=/usr -D orgname=$ORG -e -d -s  $OPTS  &&
  make                           	&&
  prepare_install                 	&&
  make    install                 	&&
  make    installclean

) > $C_FIFO 2>&1
