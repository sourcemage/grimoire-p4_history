(

  ./configure  --prefix=/                      &&
  #make moveold                                 &&
  make                                         &&
  prepare_install                              &&
  make install                                 &&
  ./generate-modprobe.conf /etc/modprobe.conf  
  
  
) > $C_FIFO 2>&1
