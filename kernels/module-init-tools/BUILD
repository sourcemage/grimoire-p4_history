(

  ./configure  --prefix=/                      &&
  if  [[ ! -f /sbin/modprobe.old ]]; then
    make moveold # Only do this once!
  fi
  make                                         &&
  prepare_install                              &&
  make install                                 &&
  ./generate-modprobe.conf /etc/modprobe.conf  &&
 #run depmod on all current kernel trees
 for i in `ls /lib/modules/`; do depmod $i; done > /dev/null 
  
) > $C_FIFO 2>&1
