( 

  cd      setgroups         &&
  perl    Makefile.PL       &&
  make                      &&
  prepare_install           &&
  make    install           &&
  cd      ..                &&
  cp      qlogin  /usr/bin  &&
  gzip    qlogin.1          &&
  cp      qlogin.1.gz   /usr/man/man1/ 

) > $C_FIFO 2>&1
