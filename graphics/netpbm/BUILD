(

  echo  -e  "gnu\nregular\nshared\ny\n\n\n\n\n\n\n\n\n\n\n\n"  |
  #  Ignores  $OPTS
  # to get our OPTS and CFLAGS, etc we'll need to sed Makefile.config.in
  ./configure                     &&
  make  all                       &&
  make  package  DIR=/tmp/netpbm  &&
  prepare_install                 &&
  echo  -e  "/tmp/netpbm\n/usr\n\n\nY\n\n\n\n\n\n"  |  ./installnetpbm

) > $C_FIFO 2>&1
