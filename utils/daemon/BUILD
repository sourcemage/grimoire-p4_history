(

  conf/linux                              &&
  make                                    &&
#  make  test                              &&
  prepare_install                         &&
  make  PREFIX=/usr  install              &&
  make  PREFIX=/usr  install-daemon-conf  
#  make  PREFIX=/usr  install-slack

) > $C_FIFO 2>&1
