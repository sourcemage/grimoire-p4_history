(

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install             &&
  
  cp  $SCRIPT_DIRECTORY/ypserv.sh     /etc/init.d  &&
  cp  $SCRIPT_DIRECTORY/yppasswdd.sh  /etc/init.d
  
) > $C_FIFO 2>&1
