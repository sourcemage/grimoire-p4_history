(
  export SYBASE=/opt/sybase

  patch -p0 < $SCRIPT_DIRECTORY/dbdimp.c.patch  &&
  printf  "\n\n\n"                               |
  perl    Makefile.PL                           &&
  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
