(

  echo  -e  "\ngnu\nregular\nshared\ny\n\n\n\n\n\n\n\n\n\n\n\n"  |
  #  Ignores  $OPTS
  # to get our OPTS and CFLAGS, etc we'll need to sed Makefile.config.in
  ./configure                     &&
  make                        &&
  make  package  pkgdir=/tmp/netpbm  &&
  prepare_install                 &&
  echo  -e  "/tmp/netpbm\n/usr\n\n\nY\n\n\n\n\n\n"  |  ./installnetpbm &&
  rm -rf /tmp/netpbm  #cleanup

) > $C_FIFO 2>&1
