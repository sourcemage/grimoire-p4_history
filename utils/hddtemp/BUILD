(

  sedit  "s:/usr/local/:/usr/:g"  Makefile     &&
  make                                         &&
  prepare_install                              &&
  make    install                              &&
  chmod   +s  /usr/sbin/hddtemp                &&
  ln  -s  /usr/sbin/hddtemp  /usr/bin/hddtemp

) > $C_FIFO 2>&1
