(

  perl -pi -e 's/\/usr\/local/\/usr/g' makefile
  make    elc                           &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
