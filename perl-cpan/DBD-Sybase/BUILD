(
  export SYBASE=/opt/sybase

  printf  "\n\n\n"       |
  perl    Makefile.PL   &&
  make                  &&
  prepare_install       &&
  make    install

) > $C_FIFO 2>&1
