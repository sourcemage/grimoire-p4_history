(

  sedit "s:install_sysv$:true:"  etc/install-etc  &&
  make    oldconfig  &&
  make    all        &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
