(

  ./configure  --prefix=/                      &&
  if  [[ ! -f /sbin/modprobe.old ]]; then
    make moveold # Only do this once!
  fi
  make                                         &&
  prepare_install                              &&
  make install                                 &&
  ./generate-modprobe.conf /etc/modprobe.conf  
  
  
) > $C_FIFO 2>&1
