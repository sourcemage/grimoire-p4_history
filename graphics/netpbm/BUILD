(

  echo  -e  "gnu\nregular\nshared\ny\n\n\n\n\n\n\n\n\n\n"  |
  #  Ignores  $OPTS
  ./configure                     &&
  make  all                       &&
  make  package  DIR=/tmp/netpbm  &&
  prepare_install                 &&
  echo  -e  "/tmp/netpbm\n/usr\n\n\ny\n\n\n\n"  |  ./installnetpbm

) > $C_FIFO 2>&1
