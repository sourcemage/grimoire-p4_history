(

  ./configure  --prefix=/usr           \
               --sysconfdir=/etc/a2ps  &&
  make                                 &&
  prepare_install                      &&
  make    install                      &&
  rm    -f  /a2ps*.el

) > $C_FIFO 2>&1
